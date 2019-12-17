# Introduction
Buying a car is not a small task and it requires a lot of money to do so. From researching the model and specs of the car to placing the down-payment, it is quite a stress to first-timers and it probably reduces the urge to buy the car once it is all settled down.  
To cope with this, we developed a system that allows the user to narrow down the intended cars based on a series of yes and no questions. It allows the reduction of indimidation done towards the user and fosters efficient communication between the salesperson and the customer, as the customer can approach the salesperson already with car model(s) in mind.

# KBS Life Cycle
## Planning
- The plan is to provide the user a with a simple "yes", "no" option expert system in order to enable them to quickly identify the needed car.
- To achieve this, the work was split between 3 group members, with the following proportions (one entry per group member):
  - In charge of knowledge acquisition and related documentation.
  - In charge of programming based on the knowledge base.
  - In charge of the user manual.

## Knowledge Definition
### Source Identification & Selection
- [The wikipedia page for list of proton car models](https://en.wikipedia.org/wiki/List_of_Proton_car_models) was selected as the knowledge source. It is assumed that the page there had all information required for the development of the knowledge base.
- This source was selected due to it being open sourced and comprehensive regarding the cars and their properties.

### Acquisition Analysis & Extraction
- The data was manually converted in to a [json file](./dataSource/carList.json) for easy maintenancing, then converted into a [csv file](./dataSource/carList.csv).
- The conversion was done with duplicates for every combination. For example if a car (car A) had options for transmission (Manual, Auto) and assembly country (Malaysia, China), there will be 4 entries as follows:

| Car Model | Transmission | Assembly Country |
| --- | --- | --- |
| A | Manual | Malaysia |
| A | Manual | China |
| A | Auto | Malaysia |
| A | Auto | China

- The sequence of the entries are not important.
- The csv was then fed into RapidMiner in order to obtain quick prototyping on which criteria had to be asked first.

## Knowledge Design
### Definition


### Detailed Design


## Knowledge Representation
### Mockler Chart



## Production Rules



# Implementation


# Systems' Testing


# Conclusions and Future Enhancement
## Conclusion


## Future Enhancement
The following future enhancements' suggestion are as follows:
- The system should be able to accept any numeric value when asking for `wheelbase`, `engine capacity` and `gear count`.
- The system should also be able to accept that the user has unknown car properties.


# User Manual
Refer to [README.md](./README.md).