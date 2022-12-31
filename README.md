# PROJECT DESCRIPTION 
The National Football League (NFL) is a professional football league where 32 teams compete in a season. It is the largest professional league for United States football. NFL is divided into two conferences: American Football Conference (AFC) and the National Football Conference (NFC). These are further divided into North, South, East, and West divisions. Each division contains four teams (New World Encyclopedia, 2022). In this project we will be displaying player and team stats, player and team awards, team rosters, team wins, player concussion injuries, player positions, player play times before and after injuries, and games missed.

## REASON 
When looking for topics to create a database around, we decided to focus on the NFL 2012-2015 seasons because the data is widely available to use and the relationships between the entities are straightforward and well defined.  This topic provides us with a good base to build our group project proposal on. </br>

## DATA SOURCE 
The data for our database will be collected from a variety of third-party sources. For data about NFL players and their concussion injuries, data will be collected from datasets on data.world in a series of .csv files. The data on games during the seasons and which injuries occurred in which match will also be provided by data.world. The public data regarding the awards given to the players will be gathered directly from the NFL website. Rosters of teams during different seasons will be gathered from The Football Database website, which shows the players and their positions for each team and each season. Since most of the data is available to the public, there should be an issue with copyright or licensing. The license of the concussion dataset on data.world is not specified, however most datasets on the website are available to the public domain, so no copyright/licensing issues should be a concern. For data sources that are not already in a .csv file format, we will create a csv file, inputting the data from the source to make our own. From all of this we will be combining the data from the three different sites into a new data file that represents all the appropriate data used in this project.

## BUSINESS RULES 
Players can only be part of one team at a time </br>
Player can have concussion injuries </br>
Games must be between 2 teams </br>
Players have contracts for a set number of seasons </br>
Teams have a home stadium. </br>
Teams sell tickets for games. </br>
Players can have new contracts or can be traded to another team and gain a new contract. </br>
Players can earn awards for a season. </br>
Teams can compete in the Superbowl at the end of the season. </br>
During a season the roster is established, members of the roster can be inactive for part of the season or the full season.</br>

## ENTITIES 
Injuries </br>
Players </br>
Teams </br>
Games </br>
Seasons </br>
Awards </br>
Rosters 

## ENTITY RELATIONSHIPS (TABLE-TO-TABLE RELATIONSHIPS) 
Rosters have Players. </br>
Teams play Games. </br>
Teams have Players. </br>
Teams have a Roster. </br>
Teams have Awards. </br>
Games are played in Seasons. </br>
Games have Teams. </br>
Players have Awards. </br>
Players have Injuries. </br>

## References 
New World Encyclopedia. (2022, September 15). National Football League. Visit the main page. Retrieved September 15, 2022, from https://www.newworldencyclopedia.org/entry/National_Football_League </br>
Teams | the football database. the football database. (n.d.). Retrieved September 15, 2022, from https://www.footballdb.com/teams/index.html </br>
NFL. (2015, January 31). 2015 'NFL honors' complete list of winners. NFL.com. Retrieved September 15, 2022, from https://www.nfl.com/news/2015-nfl-honors-complete-list-of-winners-0ap3000000466415 </br>
data.world. (2017, June 7). NFL - dataset by Alice-C. data.world. Retrieved September 15, 2022, from https://data.world/alice-c/nfl 
