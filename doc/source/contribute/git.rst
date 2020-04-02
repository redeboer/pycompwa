.. |br| raw:: html

  <br />

Working with Git
================

The source code `of ComPWA <https://github.com/ComPWA/ComPWA>`_ and `of
pycompwa <https://github.com/ComPWA/pycompwa>`_ is maintained through `Git
<https://git-scm.com/>`_, a distributed version control system that has become
the main standard in open source software development. Git allows you to track
source code files as you develop them over time, helps merging your
modifications with those of other developers, and gives you the flexibility to
switch between different ideas you're working on. Git works locally, is
blazingly fast in its operations, and will make it very difficult to lose or
corrupt files.

Despite all these benefits, however, Git can be difficult to comprehend and use
in a correct manner. As a starter, it definitely helps to `read up on the
fundamentals <https://git-scm.com/book/en/v2/Getting-Started-What-is-Git%3F>`_:
understanding how Git 'thinks' greatly helps using the Git terminal correctly.
But even then, Git requires practice, and it is only once you work together in
a team on a project that you get to use Git in its full scope.

This page illustrates some of the main Git operations you use when working on
ComPWA projects. We follow the workflow starting from the moment you cloned the
project (which you did when :doc:`getting the source code
</install/get-the-source-code>`) to the moment you locally merge your accepted
pull request into the master branch. New terms are linked to the relevant
section in the `Pro Git <https://git-scm.com/book/en/>`_ book, one of the most
accessible resources on Git (and available in several languages!).

.. note::

  These tutorials assume that you have `installed Git
  <https://git-scm.com/downloads>`_. The commands listed here are for a Unix
  system, although most Git commands are the same on all operating systems.


Starting point: :command:`git init`
-----------------------------------

Chances are that you are already familiar with Git from cloning source code of
some online project. At core, however, Git is just a tool for managing file
versions, which can be done completely locally on any collection of files
you're working on. It's quite easy to try this out, so easy in fact that it may
seem trivial, but it's a helpful exercise to familiar with the fundamental Git
concepts.

So, let's use Git to `apply version control
<https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository>`_ over
some local folder. Create an empty folder somewhere on your system and navigate
into it:

.. code-block:: shell

  mkdir test
  cd test

We call this folder the **working directory**: it's the place where you work on
your files. When we now run:

.. code-block:: shell

  git init

we create a folder :file:`.git` within the working directory. This folder is
the **Git repository** and it's the place where Git stores all settings for
that folder and keeps a version of each tracked file.

Now it's just a matter of adding files to the working directory, modifying
them, and―most importantly―telling Git to store a version of those files now
and then. In that process, there is a third concept to be aware of: the
**staging area**. In order to tell Git to store a selection of files, you have
*stage* them. In our example, let's create some files in the working directory
and stage them:

.. code-block:: shell

  touch file1.txt file2.txt # create empty files
  git add file*.txt         # stage the files

If you run :command:`git status`, you can see that :file:`file1.txt` and
:file:`file2.txt` fall under the "Changes to be committed". This means that the
two files are ready to be registered in the :file:`.git` folder. You can
:command:`git add` additional files if there were any, but let's say we are
satisfied with this selection and want to register it as a change to the
repository.

As opposed to most other version control systems, Git works in a kind of
snapshots (called "`commits
<https://git-scm.com/book/en/v2/Getting-Started-What-is-Git%3F#_snapshots_not_differences>`_")
that store **all files**, but do so smartly: files that haven't changed with
regard to the previous commit are only stored as a link to that previous
commit. A commit has to be given a short description (a message), but is always
uniquely identifiable, because it is marked with a `SHA-1 checksum
<https://en.wikipedia.org/wiki/SHA-1>`_ over all files that it contains (plus a
timestamp). To :command:`git commit` the staged file with a certain message
(:command:`-m`), run:

.. code-block:: shell

  git commit -m "initial commit"

We have now created a first commit for this repository. Now let's edit one of
the files and see what happens:

.. code-block:: shell

  echo "some content" >> file1.txt
  git status

You'll see that Git notices that :file:`file1.txt` is "modified", but that it
is "not staged". This is because there are two different files now: the empty
one that was recorded under the first commit in the :file:`.git` repository and
the modified one in your working directory. You can see the difference between
those two files with :command:`git diff`.

To register this new change, stage the changed file and commit it. We can
lazily stage all (:command:`-A`), because already know from :command:`git
status` that only :file:`file1.txt` was changed, and Git won't stage files that
weren't changed:

.. code-block:: shell

  git add -A
  git commit -m "feat: add content"

As you see, Git has registered that "1 file changed" with "1 insertion". If you
now run :command:`git log`, you'll see that there are two commits, each with a
unique SHA-1 code. With :command:`git log --oneline`, you'll have a more
condense overview with an abbreviated SHA-1. Here it's ``e41a065`` and
``e28a30c``, but it can be anything as the SHA-1 also entails the timestamp.

It's important to realize that the Git repository now contains *three files*:
an empty :file:`file1.txt` in the first commit, a :file:`file1.txt` with "some
content" in the second commit, and empty :file:`file2.txt` in both commits.
This is the core of version control: Git has organised these three file
versions in two 'snapshot' commits and has recorded how the files in those
commits relate to each other.

As you can see in the :command:`git log`, we (the "HEAD") are currently
situated in the second commit. In addition, by running :command:`git status`,
we know that there is "nothing to commit" and that the "working tree clean":
this means that the files we see in the working directory in the working are
exactly the same as the ones in that latest commit. Now, Git allows you to
"checkout" the files of the previous commit using its SHA-1 (use the one you
see in your own log):

.. code-block:: shell

  git checkout e41a065

Now :file:`file1.txt` is again the good old, empty version. To move back to the
other version, we checkout the second commit again with:

.. code-block:: shell

  git checkout e28a30c

We've now mastered the most basic operations of Git! For more of these
fundamental operations, see `this page
<https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository>`_.

.. figure:: https://git-scm.com/book/en/v2/images/areas.png
  :alt: the three stages
  :align: center

  Main concepts when registering changes with Git.


Trying out different ideas: branching
-------------------------------------




Working together: remotes
-------------------------


.. warning::

  Old text from here on

If you are new to git, maybe you should read some documentation first, such as
the `Git Manual <https://git-scm.com/docs/user-manual.html>`_, `Tutorial
<http://rogerdudler.github.io/git-guide/>`_, a `CheatSheet
<https://services.github.com/on-demand/downloads/github-git-cheat-sheet.pdf>`_.
The `Git Pro <https://git-scm.com/book/en/v2>`_ book particularly serves as a
great, free overview that is a nice read for both beginners and more
experienced users.

For your convenience, here is the Git workflow you should use if you want to
contribute:

1. Log into GitHub with your account and fork the ComPWA repository
2. Get a local copy of repository: |br|
   ``git clone git@github.com:YOURACCOUNT/pycompwa.git`` |br|
   (this uses the SSH protocol, so you need to `set your SSH keys
   <https://help.github.com/en/github/authenticating-to-github/managing-commit-signature-verification>`_
   first)
3. Add the main repository as a second remote called ``upstream``: |br|
   ``git remote add upstream git@github.com:ComPWA/pycompwa.git``

.. note::
  You can name the repository with any name you wish: ``upstream`` is just a
  common label for the main repository.

  Note that the remote from which you cloned the repository is named ``origin``
  by default (here: your fork). A local ``master`` branch is automatically
  checked out from the origin after the clone. You can list all branches with
  ``git branch -a``.

You repeat the following steps until your contribution is finished. Only then
can your contributions be added main repository through a `pull request
<https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/about-pull-requests>`_
(PR).

* ... edit some files ...
* Check changes: ``git status`` and/or ``git diff``
* Stage updated files for commit: |br|
  ``git add -u`` or add new files ``git add <list of files>``
* Commit changes: ``git commit`` (opens up editor for commit message)
* Enter a meaningful commit message. First line is a overall summary. Then, if
  necessary, skip one line and add a more detailed description form the third
  line on.
* Synchronize with the changes from the main repository/upstream:

  - Fetch new changes: |br|
    ``git fetch upstream``
  - Re-apply your current branch commits to the head of the ``upstream`` master
    branch: |br|
    ``git rebase -i upstream/master``
  - At this point, conflicts between your changes and those from the main
    ``upstream`` repository may occur. If no conflicts appeared, then you are
    finished and you can continue coding or push your work onto you fork.
    Otherwise repeat these steps until you're done (you can abort the whole
    rebase process via ``git rebase --abort``):

    + Review the conflicts (`VS Code <https://code.visualstudio.com/>`_ is a
      great tool for this)
    + Mark them as resolved ``git add <filename>``
    + Continue the rebase ``git rebase --continue``
* Push your changes to your fork: |br|
  ``git push origin <branchname>`` |br|
  This step 'synchronizes' your local branch and the branch in your fork. It is
  not required after every commit, but it is certainly necessary once you are
  ready to merge your code into ``upstream``.

.. tip::
  Remember to commit frequently instead of submitting a PR of just one commit.
  Making frequent snapshots (commits) of your work is safer workflow in
  general. Later on, rebasing can help you to group and alter commit messages,
  so don't worry.

.. tip::
  It can be useful to push your local branch to your fork under a different
  name using: |br|
  ``git push origin <local-branchname>:<remote-branchname>``

Once you think your contribution is finished and can be merged into the main
repository:

* Make sure your the latest commits from the ``upstream/master`` are rebased
  onto your new branch and pushed to your fork
* Log into GitHub with your account and create a PR. This is a request to merge
  the changes in your fork branch with the ``master`` branch of the pycompwa or
  ComPWA repository.
* While the PR is open, commits pushed to the fork branch behind your PR will
  immediately appear in the PR.

Commit conventions
^^^^^^^^^^^^^^^^^^

* In the master branch, it should be possible to compile and test the framework
  **in each commit**. In your own topic branches, it is recommended to commit
  frequently (WIP keyword), but `squash those commits
  <https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History>`_
  to compilable commits upon submitting a merge request.
* Please use `conventional commit messages
  <https://www.conventionalcommits.org/>`_: start the commit subject line with
  a semantic keyword (see e.g. `Angular
  <https://github.com/angular/angular/blob/master/CONTRIBUTING.md#type>`_ or
  `these examples
  <https://seesparkbox.com/foundry/semantic_commit_messages>`_,
  followed by `a column <https://git-scm.com/docs/git-interpret-trailers>`_,
  then the message. The subject line should be in imperative mood—just imagine
  the commit to give a command to the code framework. So for instance:
  ``feat: add coverage report tools`` or ``fix: remove ...``. The message
  should be in present tense, but you can add whatever you want there (like
  hyperlinks for references).


Linear commit history
---------------------

* Note on rebasing
* Note on squashing upon pull request
* Note on keeping branches topical
