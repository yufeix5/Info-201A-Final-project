# Technical Report

## New York City Airbnb

**Project:** A Data Analysis and Visualization of New York City Airbnb Distribution in 2019.

**Group members:**
* Klein Wang (kleinwang743@gmail.com)
* Lexi Xia (Lexiisxia@gmail.com)
* Lei Lei (leilei09282000@gmail.com)
* Shawn Song (songshaobo2000@gmail.com)

Info-201: Technical Foundations of Informatics<br>
The Information School<br>
University of Washington<br>
Autumn 2019


### 1.0 Introduction

**1.1 Problem situation**

We are researching Airbnb in New York, 2019. The stakeholders of Airbnb is the hosts who run Airbnb as well as the neighborhood associations who give a lot of regulations and prohibitions to them. Their values and tensions come from financial problems, tourist satisfactions and how the surrounding places are changing. While Airbnb makes many tourists' life more convenient, it also causes some unavoidable policy and ethical issues. The hosts may not enforce the local lodging law or may violate the housing contract. The attraction of more tourists may impact the local community in many ways such as environmental pollutions and property regulations. Also, the hosts are able to decide their own guests with discriminations.
Professionals have done a lot of work in this area. They looked at research topics such as how Airbnb will have an impact on nearby areas and how crime rates are related to the region's Airbnb population. One of the concept cards discusses stakeholder perspectives and values, and it motivates us to think about about the host and neighborhood of airbnb, which has great influence in the system and the user of Airbnb. This is an important topic because stakeholders hold different values directly or indirectly from the designer in the system. Therefore, a question is raised about which ideas and values are brought into the system by stakeholders, and how are the user be impacted by this.

**1.2 What is the problem?**

Our problem is to find out the information of Airbnb in New York, 2019 by analyzing datasets, including the price levels, distribution of different types and locations, etc. We are looking for reasons why Airbnb is numerous and popular in certain areas. We studied some key factors such as location, tourist attractions and available time to find the most reasonable explanation.


**1.3 What does it matter?**

Nowadays, Airbnb has become an increasingly popular way for travelers to expand their travel possibilities and experience the city in a more unique way. In our research, the analysis of the data set can help us understand what are some of the most important factors that contribute to the distribution of Airbnb in New York City. And also to understand Which type of Airbnb do people prefer in current days. It is important because it influences the general public. Both users and stakeholders of this system care about it. Moreover, this will help system users eliminate potential discrimination when choosing Airbnb.

**1.4 How it will be addressed?**

We will begin our research by analyzing the relationship between the location and quantity of Airbnb using the data from the first data set. We analyzed all the popular nightborhood groups in New York and made a bar chart to see the correlation between these two factors. We also specified this map for the airbnb room type provided by the nightborhood.
Second, we will analyze the possible correlation between the price and popularity of aribnb in the region through scatter plots. We are likely to study more data that will help Airbnb distribution in future work. The analysis will be displayed through data visualization, such as bar and scatter plots. Since the data set may be affected by feedback loops and other factors, more information may be needed throughout the study. The audience we work with may be Airbnb users and stakeholders. This analysis will help users eliminate bias when choosing Airbnb and help stakeholders provide more popular choices to users.

### 2.0 Research questions

* Is there a trend between the price and the popularity of Airbnbs in that area?

* Are there any correlations between availability days and locations?


### 3.0 The data set

**Data set 1: New York City Airbnb Data**


_Creator_: Inside Airbnb

_Why created_: It is created for people to explore how Airbnb is been used in cities within world.

_Where to access_: The dataset can be accessed through kaggle.com.
https://www.kaggle.com/dgomonov/new-york-city-airbnb-open-data

_Observation_: One airbnb choice in New York repersents an observation and there are 397 in total.

_Variables_: There are 16 variables each observation have. They are:
id, name, host id, host name, neighbourhood group, neighbourhood area, latitude, longitude, room type, price, minimum nights, number of reviews, last review, reviews per month, calculated host listings count, availability 365.

_Size_: it is about 7MB, at the Inside Airbnb website, it is sub-set for majority of the airbnb in the world.
people: the id and name of the host for airbnb.

_people_: The dataset include the name and id of the host. The user is excluded from the dataset.

_strength and weakness_: some strength of this dataset is it includes specific data about specific information of each airbnb, which covers location, host information and price. It is close to what is been said in the envisioning card, about how stakeholders may hold different value with designers of the system.
Some weakness is that it exclude any information about the nerghtborhood situation and the user of airbnb.

_Data wrangling_: We used dyplr to organize the data based on their neightborhood, room type and number of each room type. Then we use bar graph to persent it visualy.

### 4.0 Information Visualization
So far, we finished the first graph. For that graph, we used room type and neighborhood to draw the bar graph. We began with organize the data by neighborhood group, then we calculated the number of each room type that each neighborhood have. Then we use three vaiables: neighborhood group, number of each room type and room type to create a bar graph. The bargraph can be interactive for user to see the information of one specific neightborhood group.


### 5.0 Technical description of Shiny application



### 6.0  Conclusion
The advantage of this project is that the data we use is more objective and fact based. It helps us to come to more objective conclusions. Some of the weaknesses are that data sets are lacking information from tourists, so the conclusions may be biased. In this project, we learned a lot, especially with the use of Shiny. We are also beginning to see the correlation between the number of rooms and the neighborhoods, which brought us closer with solving our research questions. In the future, we will continue to analyze the data set and have a better understanding of the data set to solve our research problems.


### Acknowledgements
Saurav Sawansukha


### Appendix 1: Data Dictionary

### Appendix 2: Reflections

**Klein Wang**

**Lexi Xia**

**Lei Lei**

Something I learned throughout this project is the use of Shiny and ggplot. Me and my teammates struggled a lot when creating Shiny and inserting graphs. Something I would done differently is to not have people work on their code individually,  because people may have difficulty understanding each other's code. Writing code together can complete the job more efficiently. I am the writer of this project, and I helped with the coding.

**Shawn Song**

### Appendix 3: Use of Envisioning Cards
_Elict stakeholder Views and Values_: This card raised question about what values and views stakeholder may bring to the system and how does it effect the system. It relates to our research question on How does the values of the host impact the user of Airbnb.

### References

[1] Cox, M. (2019). *_Airbnb:New York City_* Retrieved from
http://insideairbnb.com/get-the-data.html

[2] Ma, A. (Mar 2, 2016). *_Listing in NYC_* Retrieved from
https://nycdatascience.com/blog/student-works/how-airbnb-is-in-nyc-interactive-data-visualization-in-r/
