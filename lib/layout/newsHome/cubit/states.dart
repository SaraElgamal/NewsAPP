abstract class statesNews {

}
 class statesInitialNews extends statesNews{}
class statesBottomNavNews extends statesNews{}
class statesBusinessLoadingNews extends statesNews{}
class statesbusinessSuccessNews extends statesNews{}
class statesbusinessErrorNews extends statesNews{
 final String error;

  statesbusinessErrorNews(this.error);

}
class statesSportsLoadingNews extends statesNews{}
class statesSportsSuccessNews extends statesNews{}
class statesSportsErrorNews extends statesNews{
 final String error;

 statesSportsErrorNews(this.error);

}
class statesscienceLoadingNews extends statesNews{}
class statesScienceSuccessNews extends statesNews{}
class statesScienceErrorNews extends statesNews{
 final String error;

 statesScienceErrorNews(this.error);

}
class statesearchLoadingNews extends statesNews{}
class statesSearchSuccessNews extends statesNews{}
class statesSearchErrorNews extends statesNews{
 final String error;

 statesSearchErrorNews(this.error);

}