new fullpage('#fullpage', {
  //options here
  autoScrolling:true,
  scrollHorizontally: true,
  scrollOverflow: true,
  anchors: ["nuansa2018", "nuansa2017", "nuansa2015", "nuansa2014", 
            "nuansa2013", "nuansa2012", "nuansa2011", "nuansa2010", 
            "nuansa2009", "nuansa2008" ],
  navigation: true,
  navigationPosition: 'right',
  navigationTooltips: ["2018", "2017", "2015", "2014", 
                       "2013", "2012", "2011", "2010", 
                       "2009", "2008" ],
});

//methods
fullpage_api.setAllowScrolling(true);