Theory
======

Overview
--------

In general one is interested in gaining knowledge about the interaction of
particles. Herefore particle reaction experiments are performed to validate 
theoretical models and extract physical quantities and information (based on 
those models). To validate and extract information a comparison of the data from
the experiment and the theoretical model is needed.

The probablity amplitude :cite:`weinberg_1995,p.113`  of an initial state 
:math:`\Psi_i` going to a final state :math:`\Psi_f` is

.. math::

   S_{fi} = \left< \Psi_f \middle| S \middle| \Psi_i \right> = -2\pi i \delta^4(p_i - p_f)M_{fi}.

This is a general formula, so the particle content of the initial and final
state is arbitrary.

Experimental physicists measure transition rates or cross sections instead of
the transition probablity. There are two special cases of initial states, since
many experimental measurements fall under these two categories:

1. Single particles in the initial state (:math:`N_I=1`)

   This is a single particle decaying into the final state particles. Here the
   decay rate :cite:`weinberg_1995,p.136` is 

   .. math::

      d\Gamma(i \rightarrow f) = 2\pi |M_{fi}|^2 \delta^4(p_f - p_i) d\Phi_f

   :math:`d\Phi_f` is the phase space element of the final state, which is
   needed to make a comparison with data. More on this below.

2. Two particles in the initial state (:math:`N_I=2`)

   The cross section of a two particle scattering/production process
   :cite:`weinberg_1995,p.137` is

   .. math::

      d\sigma(i \rightarrow f) = (2\pi)^4 u_i^{-1} |M_{fi}|^2 \delta^4(p_f - p_i) d\Phi_f

   with :math:`u_i^{-1}` the relative velocity of the initial state particles.

Describing multi body problems (more than 2) is a difficult task, since the
interaction of more than two particles is difficult to describe
:cite:`weinberg_1995,ch.4`. 

One can resort to a simplification to treat a many body interaction by successive
two body interactions. For N body particle decays (N > 2) this is known as the
isobar model. Here a particle into N final state particles is modeled
by a sequence of two particle decays. This is also also a assumption of the 
helicity/canonical formalism.

 
Helicity Formalism
------------------


Two particle states are the key element here. With these one can construct
states of total Spin J and projection M. 

The probablity amplitude of a state with spin J and projection M decaying into
two particles 1 and 2 with helicities :math:`\lambda_i` and momentum 
:math:`\vec{p}` in the cms frame is given by :cite:`chung2006spin,p.16` 

.. math::
   
   two body decay amplitude here

In the helicity formalism sequential two body decays are easy to handle

.. math::
   
   seq two body decay amplitude here

Then show explicity what ComPWA implements and which components correspond to
what part in the equation. So we would refer in the doxygen docs to

- the Wigner D functions 
- the Kinematics class
- the IntensityBuilderXML with the two functions createSequentialAmplitudeFT
createHelicityDecayFT
- the dynamical functions
- the phase space element calculations?

https://compwa.github.io/ComPWA/classComPWA_1_1Physics_1_1IntensityBuilderXML.html


Canonical Formalism
-------------------

The canonical formalism gives access to the orbital angular momentum :math:`L`
and the coupled Spin :math:`S` arising from a two particle state.

There is a simple connection between the two formalism. Show that here

This expression is simply inserted into equation () and that is it!

The choice of the formalism depends on the physics process being analyzed. Give
an example here.


Comparison with Measurements
----------------------------

luminosity L

measurements N

cross section :math:`\sigma`

.. math::
  
   \frac{dN}{d\Phi_f} = L \cdot \frac{d\sigma}{d\Phi_f}

Number of events in a infinitesimal phase space element :math:`\Phi_f` is
proportional to the cross section of a initial state transitioning to the final
state in the infinitesimal phase space element.

This section should clear up the phase space element problem we are having.
I'm not sure its just a plotting problem. Since there one makes the transition
from unbinned to binned data...

Bibliography
------------

.. bibliography:: refs.bib
   :style: unsrtalpha