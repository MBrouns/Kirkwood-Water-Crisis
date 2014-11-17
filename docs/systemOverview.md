# System Overview

This document will describe the system elements and boundaries as identified in the Kirkwood water crisis system.

The following systems have been identified:

- Population System
- Infrastructure System
- Maintenance staff system
- Municipal funds system

There are several interfaces between these systems. These are:

- The maintenance of infrastructure is limited by maintenance staff availability and municipal funds availability. 
- The building of new infrastructure or restoring aged infrastructure is limited by maintenance staff and municipal funds availability.
- The need for new infrastructure is determined by the discrepancy between maximum infrastructure capacity and total population demand. 
- The productivity of the technical staff is influenced by their work pressure. 



# Experimental setup
The base unit of the model is in years. The system is observed over a period of 50 years, since this allows for several cycles of infrastructure ageing and rebuilding. As a solver method runge-kutta4 is chosen. The time step needs to be ranging from 0.5 to 0.1 times the smallest time-constraint in the system. Currently in the model this is 1/10th of a year for planning to address discrepancies in infrastructure. Therefore the time-step of 0.015 is chosen.

# Population System

# Infrastructure System
The infrastructure system describes the commissioning, decommissioning and maintenance of the water supply system in the Kirkwood area.

## Assumptions
Several assumptions needed to be made due to gaps in the background reading. These assumptions are described in this section.

### Effect of maintenance on ageing time
In the background reading it was described that at 8% maintenance per year the average aging time of infrastructure is 30 years. We assumed that when there is 0% of the infrastructure is maintained per year, the average aging time will become 15 years. Having a higher maintenance coverage than 8% will not increase the lifespan of infrastructure.

### Effect of capacity pushing on ageing time
The background reading described that pushing the infrastructure can drastically decrease the lifespan of infrastructure. We assumed that at the maximum pushing of infrastructure of 30% the lifespan of infrastructure is decreased by 10 years.

### Required staff for constructing and planning infrastructure
Constructing new water infrastructure is mostly done by staff on a governmental level rather than staff on the municipal level. However, some supervision is still required by municipal staff. We assume that municipal staff is required for about 10% of the construction and planning activities. The rest is carried out by governmental staff which is out of scope of this model.

