# Kirkwood Water Crisis
This repository contains the files for the Delft University of Technology course SPM9155 Advanced Systesm Dynamics.

This readme contains some of the background knowledge regarding the topic. 

This repository is structured as following:

```
kirkwood-water-crisis/
  |- vensim/		- The vensim model files
  |- |- results/	- Results from the netlogo model
  |- readings/		- Relevant background readings
  |- doc/			- Self-written documentation
  |- analysis/		- Code for data analysis
  |- readme.md		- This document
```

## Background

### Modelling task
You are required to develop a model of the situation of ongoing crisis in Kirkwood in which demand for water services continues to grow, the water infrastructure cannot cope, and there are insufficient financial resources and technical capacity to address the problems adequately. Your task is to show that the recent crisis in Kirkwood in which residents resorted to violent protest owing to failures in water service delivery, is symptomatic of these underlying problems. 

### Background (extract from d’Hont et al (2013) “Addressing stakeholder conflicts in rural South Africa using a water supply model”)
“Following the apartheid era, the democratically-elected government of the Republic of South Africa undertook to ensure that all citizens had access to basic water services. This was a significant challenge given that the water resource and water services were no different from the other resources and services in South Africa, which were inequitably distributed across racial groups in a purposeful and designed manner. In particular, the technical supply of water services was primarily designed for the white minority. From 1996 onwards numerous changes at a national level resulted in a complete restructuring of water policy and legislative frameworks. The changes relevant to water services include:  the Constitution of 1996, which positions access to water as a basic human right for all; the Water Services Act of 1997, which separates provision and regulation in a decentralised manner; the National Water Act of 1998, which legislates a basic human needs reserve that comes before all other allocations in the country, and the policy of free basic water, which was formalised in 2001.The Constitution differentiates three spheres of government, namely national, provincial and local government (Juta’s Statutes Editors, 2010), with the responsibility for service delivery residing in the ‘local government’, or municipal, sphere. One of the service delivery duties of the local government is to ensure the provision of water and sanitation services to all users within a municipal jurisdiction. The Sundays River Valley Municipality  (SRVM), located within the Lower Sundays River Valley sub-catchment, within the Eastern Cape province of the Republic of South Africa (Figure 1), is struggling with this task. 

With no large urban settlement, and a combination of multiple small towns and commercial farming, the SRVM is a primarily rural or prototypical ‘Category B3’ municipality. As of 2009, 111 of the 278 municipalities in South Africa are classified in this category (World Bank, 2009: 10-11). As such, the SRVM does not stand alone in South Africa in its struggle with the provision of water and sanitation services to citizens living within the municipal boundaries. Nor is it alone in having to deal with contentious issues related to the historical design and operation of its water supply system.”


### Model related information
#### Population
Ten thousand people resided in Kirkwood in 2001 and forty thousand people lived in the surrounding Lower Sundays River Valley. The endogenous growth in population in the Lower Sundays River Valley (LSRV) is estimated at 1,2%. People move into the urban area of Kirkwood every year – both from rural areas and from other small towns in LSRV e.g. Paterson, Addo, Enon-Bersheba. The immigration rate to the urban area of Kirkwood is estimated to be 1,5% per annum.  The emigration rate from Kirkwood is 1% per year. Of the total Kirkwood population, 3% moves into households that are not connected to the water supply system (i.e. they contribute to the ongoing growth in unconnected households). The average number of people per household is 3,9 (2001 SA census figure).

#### Water system
The goal of the water system is to have sufficient water to meet demands and to deliver to users the water they require. However, when there is insufficient water to meet demand, then the water system ideally delivers water to users in proportion to their demand. The water use per connected household is 347 kl/year whereas the annual average water use per unconnected household is 180 kl/year. Water is delivered to connected households, unconnected households (via communal pumps etc. ) and to other urban users, whose use is about 50% of that of the current total household demand (i.e. connected and unconnected). The rate of connecting households to the service network is 8%/year. In 2001 there were about 700 households connected to the service network, and there were 1500 unconnected households.

#### Finances and infrastructure
The currency in South Africa is the South African Rand (international symbol ZAR, South African symbol R). The percentage of the municipality’s income that is used for water infrastructure maintenance is 40% on average. The average annual maintenance cost per unit of capacity (Ml/year) is kZAR2,5. However, in reality the amount spent on maintenance each year is this money plus the annual financial bail-out that the municipality receives from the central government.  This is currently kZAR 150 per annum. It is unclear if this financial bail-out will persist in the future.  If this bail-out were to cease, the municipality will experience a financial crisis.
The average lifetime of the water infrastructure is 30 years (based on 5 classes of infrastructure assets in the depreciation table of the Amatola Water 2012 Annual Report), assuming that 8% of the infrastructure receives regular maintenance per year. In 2001, the infrastructural capacity for Kirkwood was 1825 Ml/year (approximately 5 Ml/day). The water that is produced by the aging infrastructure of Kirkwood, is produced by pushing the infrastructure over its design capacity; sometimes it exceeds the design capacity by as much as 30%.  Continued over-extension of the infrastructure makes it age more quickly, increasing its obsolescence rate. It takes 5 years on average to refurbish or construct infrastructure, but it takes 1/10th of a year to acknowledge, or plan to address, the discrepancy in infrastructure.
Not all water service delivery costs can be recovered, nor are all bills paid. There are substantial water losses due to leakage – with an average loss percentage of 30%.  But, only about 40% of the costs of household service delivery can be recovered. 75% of other urban water users (shops, hospitality industry etc.) are billable. Revenue derived from water service provision is influenced by the percentage cost recovery, the volume of water supplied (and billable) and the unit charge (ZAR 1000 per Ml or ZAR 10/kl). It is diminished by the costs of maintenance and the annual budget reconciliation of the municipality.  All money is used up by the municipality each year. 

#### Service delivery crisis
The South African water law (1988) as specified in the DWA 2002 norms and standards (nr. 4) specifies that a basic amount of 10l/person/day must be supplied. In effect this means that the municipality should ship in water when service delivery ceases owing to infrastructure failure. One tanker load of water has a volume of 11kl .
The discrepancy between the water delivered to the users (unconnected, connected and other urban users) and their demand for water, determines how well the municipality is doing in meeting water demands. When there is a water service delivery crisis, the ratio of the total discrepancy to the total delivered water can be much greater than 1, driving the technical staff of the municipality to devote attention to the crisis and neglect primary activities (routine maintenance) or other secondary activities like refurbishment and infrastructure construction, or even planning. Under a crisis situation, the attention given to the crisis compared with other activities can attain ratios of 10:1.

#### Technical staff
In 2001 there were 10 technical staff in the service of the municipality. In addition the lack of sufficient technical staff means that they experience work pressure and so do not achieve the normal production rate per person per year of 20 Ml/year. When there are few staff compared with the staffing capacity required to undertake the work, there is a staffing crisis and the productivity can decrease almost to zero. When there are more staff than required the productivity per staff member can increase by up to 50%. The municipality hires one new technical staff member every two years and technical staff remain in the organization an average of 10 years
The activities of technical staff in relation to infrastructure are constrained by staff capacity or finances. When there is either a financial or technical constraint on primary and secondary activities then the attention is divided pro ratio between primary and secondary activities.  In addition, the attention given to secondary activities is divided as follows:
•	25% of the available attention is given to long term and short term planning (recognition of the discrepancy between the current infrastructural capacity and the capacity that is necessary to meet anticipated demands)
•	75% of the available attention is given to infrastructure construction.

Prepared by:
Jill Slinger
November 2014

