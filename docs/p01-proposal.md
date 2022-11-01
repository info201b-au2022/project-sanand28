
# Air Quality and Wildfire Trends Over the Last 5 Years: Project Proposal

## Code Name
SABA AQI

## Authors
Alani Gayles, Shruti Anand, An Dao, Brandon Mochizuki

## Affiliation
INFO-201: Technical Foundations of Informatics - The Information School - University of Washington

## Date
Autumn 2022

## Abstract
In this project, our main question is how the air quality in the United States has changed in recent years. This question is important because air pollution is one of the most concerning environmental issues due to its relations to climate change and wildfires, and there are an estimated [7 million premature deaths annually which are attributed to poor air quality](https://www.who.int/health-topics/air-pollution). To address the question, we will analyze the air quality index data in the United States along with data on Wildfires and Acres Burned by State from 2017 to 2021.

## Keywords
AQI; air pollution; wildfires

## Introduction
How has air quality changed in the United States in recent years? We plan to address this central question through our detailed analysis of the AQI (Air Quality Index) dataset spanning from 2017 to 2021 as well as the data concerning Wildfires and Acres Burned along the same time frame. By analyzing and corroborating the two datasets, we hope to gain insight on if there is a correlation between a poor air quality index and the increase in wildfires in the United States. Air pollution as well as climate change are issues that directly impact everyone, since poor air quality [is linked to increased mortality and can lead to a plethora of side effects](https://climatenexus.org/wp-content/uploads/2015/09/HumanHealthEffectsofAirPollutionKampaandCastanas.pdf). Gaining knowledge about if there is a correlation between the amount of acres burned by wildfires and the air quality in the surrounding region will be helpful to anyone who lives near an area prone to wildfires.

## Problem Domain
### Direct and Indirect Stakeholders
For this project, direct stakeholders would be environmental agencies and researchers who dedicate their time to figuring out patterns in air quality numbers. For example, the United States Environmental Protection Agency has research related to air quality and its effect it has on individuals’ health. This links to who the indirect stakeholders are: any individual whose health could be affected by poor air quality. This data visualization can inform residents living in cities that are surrounded by smoke during fire season and by [air pollution from vehicles, factories, wildfires, and more, when and where air quality is the worst](https://www.epa.gov/air-research/ambient-air-quality-source-measurement-and-emissions-factors-research).

### Human Values
The world is becoming more populated and climate change is in action and showing itself more and more every day. It’s important that we do our part to recognize these changes in the world and use data to our advantage to improve the statistics. [In Washington, air quality was the worst it’s been in years](https://www.washingtonpost.com/climate-environment/2022/10/20/seattle-air-quality-worst-in-world/), and understanding if it is linked to the amount of acres burned in wildfires is important to the health of residents. This is because we can then find ways in our daily life that will help us prevent the increase of air pollution.

### Potential Benefits and Harms
[Having knowledge and basic understanding of air quality has many benefits](https://www.epa.gov/indoor-air-quality-iaq/wildfires-and-indoor-air-quality-iaq).However, factors that add to poor air quality have many harms. Over the past few years, wildfires have grown exponentially in size and affected many cities and countries around the world. The benefit of collecting this data means we can spot trends in air quality numbers and predict the probability of it bettering or harming us more. Wildfires play a large role in poor air quality and with the proper funding, preventative measures can be allocated in fighting these wildfires.

#### Project Framing
The primary focus of this project is about natural sciences, since wildfires and poor air quality are environmental issues. [The increase in wildfires in the west coast is caused by the increased heat and droughts from climate change](https://www.science.org/doi/full/10.1126/science.1128834), so this project is referencing an aspect of climate change as well. We intend to compare the different air quality numbers throughout the past 5 years, and see if there is a recognizable correlation between wildfires and poor air quality in Washington.

## Research Questions
Air quality has become a point of discussion recently in Seattle, due to it being [ranked as the city with the worst air quality in the world recently by the air quality monitoring site IQAir](https://www.washingtonpost.com/climate-environment/2022/10/20/seattle-air-quality-worst-in-world/). As an increasing amount of people are starting to be concerned and researching the topic, we wanted to address several common questions that may arise.

### How does average air quality differ between states?
There are thoughts that air quality is poor in the west coast due to increasing wildfires. Several locations on the east coast also are thought to have poor air quality from pollution caused by high population density. The average air quality in all states will be compared to see which ones currently rank the best and worst.

### Is there a trend in the change in air quality in Washington and other states in recent years?
The general belief is that air quality is worsening in recent years. On the west coast, Washington seems to have an increasing number of spikes of unhealthy air quality due to wildfires over the last several years. This didn’t seem like a problem in the past, but is this actually true? Air quality in Washington and other states will be compared over a period of five years to see if there are any trends or other insights.

### Is there a relationship between air quality and the acres burned from wildfires? If so, how are they related?
Some major contributors to poor air quality are [ash and gasses from volcanic eruptions, smoke from wildfires, pollution from vehicle emissions, and pollution from factories and power plants](https://www.niehs.nih.gov/health/topics/agents/air-pollution/index.cfm). Smoke from wildfires is a contributing factor, but exactly how much is it affecting air pollution? The yearly data for acres burned by wildfires will be compared to the average air quality in the United States to look for trends.

### What locations tend to have sudden spikes in air quality?
Information about the average air quality in locations may be useful for a general understanding of air quality, but it’s possible for locations to have hazardous air quality for just a day or two in a year. These locations will be hidden in averages but can be uncovered by looking at the maximum and minimum air quality index over a year or by looking at the change in AQI between days for spikes.

## Dataset
Table 1. Summary of datasets.
Data file
No. Observations
No. Variables
[Daily AQI by CBSA in 2021](https://aqs.epa.gov/aqsweb/airdata/download_files.html#AQI)
169,626
8
[Daily AQI by CBSA in 2020](https://aqs.epa.gov/aqsweb/airdata/download_files.html#AQI)
169,777
8
[Daily AQI by CBSA in 2019](https://aqs.epa.gov/aqsweb/airdata/download_files.html#AQI)
170,430
8
[Daily AQI by CBSA in 2018](https://aqs.epa.gov/aqsweb/airdata/download_files.html#AQI)
172,841
8
[Daily AQI by CBSA in 2017](https://aqs.epa.gov/aqsweb/airdata/download_files.html#AQI)
173,601
8
[Wildland Fires and Acres Burned by State in 2021](https://www.predictiveservices.nifc.gov/intelligence/2021_statssumm/fires_acres21.pdf)
n/a
7
[Wildland Fires and Acres Burned by State in 2020](https://www.predictiveservices.nifc.gov/intelligence/2020_statssumm/fires_acres20.pdf)
n/a
7
[Wildland Fires and Acres Burned by State in 2019](https://www.predictiveservices.nifc.gov/intelligence/2019_statssumm/fires_acres19.pdf)
n/a
7
[Wildland Fires and Acres Burned by State in 2018](https://www.predictiveservices.nifc.gov/intelligence/2018_statssumm/fires_acres18.pdf)
n/a
7
[Wildland Fires and Acres Burned by State in 2017](https://www.predictiveservices.nifc.gov/intelligence/2017_statssumm/fires_acres17.pdf)
n/a
7


Each of the Daily AQI by CBSA data files gives information about the AQI and the category that the air quality would fall into for every day in that current year. This data allows us to determine what the average AQI was and what category the air quality for that year fell into. Through this, we will be able to see the trend of air quality over the 5 years worth of data that we have. The data from these data files comes from the United States Environmental Protection Agency’s Air Quality System (AQS). The data was reported to the United States Environmental Protection Agency (EPA) from data collection agencies for EPA internal use which includes daily and annual summaries. These data files were posted [on the EPA website where we obtained the data](https://aqs.epa.gov/aqsweb/airdata/download_files.html#AQI).
The Wildland Fires and Acres Burned by State data files provide us with yearly data on how many wildfires there were and how many acres were burned due to those fires. Through this data, we can make conclusions about how much impact wildfires have on the air quality that year. The data from these data files were collected by the agencies from each state’s federal wildland fire agencies with the purpose of keeping track of the national statistics of the total number of large fires, acres burned on large fires, year-to-date acres burned, and year-to-date wildfires. It is also used by NIFC Predictive Services to provide decision support information needed to be more proactive in predicting significant fire activity and figuring out what resources are needed. These data files were posted [on the National Interagency Fire Center website](https://www.nifc.gov/fire-information/statistics). They are in PDF form separated by year, with tables for each state containing information about wildfires. The NIFC got the original data from SIT/209 applications to compile their data.
All these data files come from government websites which make them trustworthy. Newspapers, researchers, and people who are interested in the study of air quality are likely to benefit from this data because they can use it for their research and articles. Since these data files provide annual data, we can aggregate the AQI dataset by year as well for comparison.

## Expected Implications
This project will help show if the amount of acres burned by wildfires correlates to poor air quality. Purely from an AQI standpoint, this information will be useful to health officials with patients who are at high risk from poor air quality. They will be able to provide this project as a reference so such patients will learn and be able to avoid traveling to places with high air pollutants as much as possible. It can also help them make decisions such as investing in an air purifier or in other indoor air purification methods.
Learning more about this potential correlation will also help government officials and other people involved with preventing and fighting wildfires. If there is a strong correlation, it could lead to more funding into preventing and fighting wildfires, such as by investing in more firefighters, suppression vehicles, and equipment. If there isn’t, resources can be allocated towards reducing other causes of air pollution such as traffic or in planting more trees for improving air quality.

## Limitations
One limitation we might need to consider is the fact that many people aren’t aware of what AQI values represent. Since they are purely numbers, a person who isn’t familiar wouldn’t know if 75 AQI is good or bad. To combat this, we will include [a table with the standard ranges for good, moderate, unhealthy, and very unhealthy, as defined by EPA](https://www.epa.gov/wildfire-smoke-course/wildfire-smoke-and-your-patients-health-air-quality-index).
Another limitation is due to COVID-19. In 2020, the COVID-19 pandemic significantly reduced human sources of air pollution. For instance, [vehicle travel distance in the U.S. decreased by 112.0 billion miles, or 39.8 percent, in April 2020 in comparison to April 2019](https://www.fhwa.dot.gov/policyinformation/travel_monitoring/20aprtvt/20aprtvt.pdf). In addition, many factories also shut down operations due to not having workers. [Manufacturing output fell by 43 percent and total work hours fell by 38 percent in the second quarter of 2020 in comparison to 2019](https://www.bls.gov/opub/ted/2022/u-s-manufacturing-output-hours-worked-and-productivity-recover-from-covid-19.htm). Due to these reasons, air pollution during 2020, especially near the start of the global pandemic, may have skewed results. To address this limitation, the effects of the pandemic will be kept in mind when creating and presenting the visualization so any viewers will also be aware of the impact COVID-19 had on 2020.

## References
Bureau of Labor Statistics, U.S. Department of Labor (2022, October 7). U.S. manufacturing output, hours worked, and productivity recover from COVID-19. The Economics Daily. Retrieved October 26, 2022, from https://www.bls.gov/opub/ted/2022/u-s-manufacturing-output-hours-worked-and-productivity-recover-from-covid-19.htm
Kampa, M., & Castanas, E. (2007, June 4). Human health effects of Air Pollution. Environmental Pollution, 151(2), 362–367. https://doi.org/10.1016/j.envpol.2007.06.012
Environmental Protection Agency. (2022, June 2). AirData Pre-Generated Data Files - Daily AQI. Environmental Protection Agency. Retrieved October 26, 2022, from https://aqs.epa.gov/aqsweb/airdata/download_files.html#AQI
Environmental Protection Agency. (2015, December 4). AirData Download Files Documentation. Environmental Protection Agency. Retrieved October 26, 2022, from https://aqs.epa.gov/aqsweb/airdata/FileFormats.html
Environmental Protection Agency. (2022, July 5). Research on Health Effects from Air Pollution. Environmental Protection Agency. Retrieved October 26, 2022, from https://www.epa.gov/air-research/research-health-effects-air-pollution
Environmental Protection Agency. (n.d.). Wildfire Smoke and Your Patients' Health: The Air Quality Index. Environmental Protection Agency. Retrieved October 26, 2022, from https://www.epa.gov/air-research/research-health-effects-air-pollution
Osaka, S. (2022, October 20). Why Seattle currently has the worst air quality in the world. Washington Post. Retrieved October 26, 2022, from https://www.washingtonpost.com/climate-environment/2022/10/20/seattle-air-quality-worst-in-world/
Statistics. National Interagency Fire Center. (n.d.). Retrieved October 26, 2022, from https://www.nifc.gov/fire-information/statistics
U.S. Department of Health and Human Services. (2022, June 24). Air Pollution and Your Health. National Institute of Environmental Health Sciences. Retrieved October 26, 2022, from https://www.niehs.nih.gov/health/topics/agents/air-pollution/index.cfm
U. S. Department of Transportation Federal Highway Administration. (2020, April). Traffic Volume Trends - April 2020. Retrieved October 30, 2022, from https://www.fhwa.dot.gov/policyinformation/travel_monitoring/20aprtvt/20aprtvt.pdf
World Health Organization. (n.d.). Air Pollution. World Health Organization. Retrieved October 26, 2022, from https://www.who.int/health-topics/air-pollution
Westerling, A. L., Hidalgo, H. G., Cayan, D. R., &amp; Swetnam, T. W. (2006). Warming and earlier spring increase western U.S. forest wildfire activity. Science, 313(5789), 940–943. Retrieved October 26, 2022, from https://doi.org/10.1126/science.1128834

## Appendix A: Questions
Do the datasets look ok? The yearly wildfire data are in table formats in a PDF [2021 PDF as an example](https://www.predictiveservices.nifc.gov/intelligence/2021_statssumm/fires_acres21.pdf), but is it ok if we compile them ourselves into a csv file?
