# Air Quality and Wildfire Trends Over the Last 5 Years: Project Report

## Code Name
SABA AQI

## Authors
Alani Gayles (aig6@uw.edu), Shruti Anand (shrana3@uw.edu), An Dao (andao27@uw.edu), Brandon Mochizuki (bmoch@uw.edu)

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

### Project Framing
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
| Data file                                                                               | No. Observations | No. Variables |
|-----------------------------------------------------------------------------------------|------------------|---------------|
| [Daily AQI by CBSA in 2021](https://aqs.epa.gov/aqsweb/airdata/download_files.html#AQI) | 169,626          | 8             |
| [Daily AQI by CBSA in 2020](https://aqs.epa.gov/aqsweb/airdata/download_files.html#AQI) | 169,777          | 8             |
| [Daily AQI by CBSA in 2019](https://aqs.epa.gov/aqsweb/airdata/download_files.html#AQI) | 170,430          | 8             |
| [Daily AQI by CBSA in 2018](https://aqs.epa.gov/aqsweb/airdata/download_files.html#AQI) | 172,841          | 8             |
| [Daily AQI by CBSA in 2017](https://aqs.epa.gov/aqsweb/airdata/download_files.html#AQI) | 173,601          | 8             |
| [Fire Occurrence Dataset](https://www.mtbs.gov/direct-download)                         | 29,534           | 23            |

Each of the Daily AQI by CBSA data files gives information about the AQI and the category that the air quality would fall into for every day in that current year. This data allows us to determine what the average AQI was for each location in particular and for the US in general as well as what category the air quality for that year fell into. Through this, we will be able to see the trend of air quality over the 5 years worth of data that we have. This could also allow us to see sudden spikes in air quality at certain locations. The data from these data files comes from the United States Environmental Protection Agency’s Air Quality System (AQS). The data was reported to the United States Environmental Protection Agency (EPA) from data collection agencies for EPA internal use which includes daily and annual summaries. These data files were posted [on the EPA website where we obtained the data](https://aqs.epa.gov/aqsweb/airdata/download_files.html#AQI).

The Fire Occurrence Dataset provides us with data on fires in the United States from 1984 to 2021, such as the fire id, date, acres burned, longitude, and latitude. Through this data, we can make conclusions about how much impact wildfires have on the air quality and how the average air quality would differ in different states. The Monitoring Trends in Burn Severity (MTBS) program was created by the U.S. Geological Survey Center for Earth Resources Observation and Science (EROS) and the USDA Forest Service Geospatial Technology and Applications Center (GTAC). Its goal is to map the burn severity and extent of all fires that are 1000 acres or greater in the United States. The data is collected from multiple fire agencies and is downloaded as a DBF shapefile, which can be converted to CSV using Microsoft Excel.

All these data files come from government websites which make them trustworthy, and the data is collected by the government as well so it should be accurate. Newspapers, researchers, and people who are interested in the study of air quality or in reducing wildfires are likely to benefit from this data because they can use it for their research and articles. Since these data files provide annual data, we can utilize the annual AQI dataset as well when looking for trends. We can also analyze the AQI dataset side by side with the Fire Occurrence dataset to see whether there is a relationship between the two datasets. If there is, we can look into it further to see if there’s a trend in air quality in Washington and other states in recent years.

## Findings
**How does average air quality differ between states?**
According to our map from the first data visualization which shows the average AQI by State from 01/01/2017 to 12/31/2021, we can clearly see that the state with the highest average AQI (worst air quality) is California and the state with the lowest AQI (best air quality) is Hawaii. States with a higher range of AQI are mostly located on the southwest coast of the country. The top three states with the highest AQI in the US - Arizona, Utah, and California - are also located in the southwest region. The AQIs of the northeast states are around the average of the country which is 40. The AQIs of the southern, northern states, and northwest states as well as Hawaii are relatively in the lower range compared to the country’s average AQI.

**Is there a trend in the change in air quality in Washington and other states in recent years?**
The air quality trend in Washington over the recent years (2017-2021) according to our third chart range from 10 to 60 on average with sudden spikes usually during the summer months (August and September). Normally, these spikes go up to around mid-100 and the highest peak was on September 13th, 2020 when the AQI went up to 316. A few days before that, on September 7th, there was a sudden spike in acres burned by wildfires that went up to almost 600,000 acres. Thus, we can see that there was a large spike around the time of August and September when wildfire season is the worst. Over the summer, there is drier heat, less rain, and more factors that contribute to high levels of air quality. However, we can see that air quality remains consistent throughout the rest of the year with no significantly noticeable spikes. This is especially true for the year 2019. The AQI trend in Washington is pretty similar to other states, especially those in the northwest region. The average AQI is pretty consistent every year. However, the sudden spikes for some states happened in different months compared to Washington.

**Is there a relationship between air quality and the acres burned from wildfires? If so, how are they related?**
All three of our visualizations showed the relationship between wildfires and AQI. For the first chart, if we choose to map the variable Average AQI, we can see that the northwest and northeast states tend to have lower AQI compared to the rest of the states. However, if we map the variables Wildfire Burnage and Wildfire Count, we can clearly see that the west and northwest states had the most wildfires and acres burned. Thus, a low AQI is not associated with a low number of wildfires, meaning there’s no positive correlation between these two variables. Moreover, if there is a correlation, there should be some sort of line with a positive or negative slope that shows up for chart two. Hovering over a point shows the state and the specific numbers. As shown, while there are strong cases like California with the worst AQI and most acres burned and Hawaii with the lowest AQI and least acres burned, most of the remaining states are fairly inconclusive. From chart three, it can be seen that although some states have sudden spikes in AQI that happened right after a wildfire, some happened way after a wildfire, or have nothing to do with wildfires.

**What locations tend to have sudden spikes in air quality?**
According to our third chart which shows the relationship between the AQI and Acres burned by Wildfires in different states, it can be seen that most states had some sudden spikes in air quality during the last five years, especially California, as well as the eastern states like Maine, New York, and Virginia. However, the northwest states, specifically Washington, Oregon, and Idaho tend to have the most extreme sudden spikes in the country. While the other states’ sudden spikes usually never surpassed 200, the sudden spike in 2020 in the northwest states was more than 400 for Oregon, 300 for Washington and 200 for Idaho respectively.

## Discussion
This project helped show if the amount of acres burned by wildfires correlates to poor air quality. Purely from an AQI standpoint, this information will be useful to health officials with patients who are at high risk from poor air quality. They will be able to provide this project as a reference so such patients will learn and be able to avoid traveling to places with high air pollutants as much as possible. For example, our first data visualization showed a map of average AQI by state from the last 5 years. We can clearly see on the map that states like Utah, Arizona, Colorado, and California have the worst AQI in the country. Meanwhile, states like Alaska, Washington, Nebraska, and Hawaii have a relatively low AQI compared to other states in the country. Although it might seem safe to travel to these states, it is actually not totally safe because some of these states have really bad wildfires during certain months compared to some other states with higher AQIs. This is the case because these two variables are not strongly correlated. Thus, this data really helps not only patients at high risk from poor air quality but also everyone else to avoid traveling to some places at certain times when air quality is bad or when there are wildfires going on because the heat from the blaze could make it more unsafe. It can also help people make decisions such as whether to invest in an air purifier or in other indoor air purification methods.

Moreover, learning more about this potential correlation will help government officials and other people involved with preventing and fighting wildfires. A strong correlation would’ve led to more funding for preventing and fighting wildfires, such as by investing in more firefighters, suppression vehicles, and equipment. Since the analyzed data from this project shows that there isn’t a strong correlation, resources can be allocated toward reducing other causes that could’ve contributed to more air pollution or sudden spikes in AQI such as traffic, extra aerosols that ended up in the air due to the excessive burning of fossil fuels, and greenhouse gas like the bad ozone. Furthermore, these resources can also be used toward finding ways to improve air quality like planting more trees, reducing human carbon footprints, producing more sources of renewable energy, and investing in NASA or other organizations that can use satellites orbiting Earth or other technology to keep an eye on air pollution.

## Conclusion
Through this project, we were able to conclude that within the last 5 years, the AQI trend over time is similar among regions in the US but differ between states. As shown in Chart 1, Hawaii has the lowest AQI while California has the highest AQI among all states. The states with a high range of AQI are in the west and southwest regions, states with an average range of AQI are located in the northeast region, and states with a lower average AQI are located in the southern, northern states, and the northwest region along with Hawaii. According to the data visualizations, there isn’t an evident difference between air quality in Washington and other states in recent years. The average range is pretty constant throughout the years for most states. However, the sudden spikes in air quality that happened in Washington state are quite different from other states that are not from the northwest region. Factors that could be taken into consideration for this difference is probably different climate and population density.  

Moreover, this project allows us to conclude that air quality and wildfires don’t have a strong correlation. The maps for Chart 1 and the scatterplot from Chart 2 demonstrate that many states with an average to relatively high AQI have very few if not no wildfires while some states with AQI on the lower side like Alaska or Washington end up having many wildfires. This is clearly shown in Chart 2 because the scatterplot’s points are scattered throughout the plot and there's no trendline that shows an obvious correlation. However, it’s still important to analyze the data separately to know which regions are more prone to getting sudden spikes in air quality or wildfires and during which season is it more dangerous to travel to these regions. From the third data visualization, it can be observed that the northwestern states usually have the most extreme sudden AQI spikes along with a higher number of wildfires during the summer. On the other hand, states with high population density, such as the eastern states, tend to have many sudden spikes in air quality throughout the year. Thus, we can see that understanding this analysis not only allows people, especially patients to distinguish and decide which actions and precautions to take in order to protect their health but also for government officials to decide how they can allocate resources in order to further understand the causes and effects of air pollution and come up a solution reducing air pollution and delay climate change.


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
Do the datasets look ok? The yearly wildfire data are in table formats in a PDF [2021 PDF as an example](https://www.predictiveservices.nifc.gov/intelligence/2021_statssumm/fires_acres21.pdf), but is it ok if we compile them ourselves into a csv file? Update: now using [MTBS's dataset](https://www.mtbs.gov/direct-download) so this isn't an issue anymore.
