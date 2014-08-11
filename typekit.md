#Adobe Typekit

Adobe Typekit is an online subscription font service featuring professionally designed typefaces that have been optimised for screen display.

##Process for setting up a new TypeKit for your site. 

1). After logging into Typekit - `"Add a new kit"`

2). Name your kit (e.g. HeroHunters), and set up the domains that the typekit will be served to:   
E.g: `tu-wear-it-your-way.look.co.uk,tu-wear-it-your-way.womanmagazine.co.uk,tu-wear-it-your-way.nowmagazine.co.uk,*.ipcdigital.co.uk`  
Or for Superdrug Hero Hunters we had: 
`*.xip.io,*.herohunters.co.uk,*.ipcdigital.co.uk,*.ipcdg.tl`
N.b. *.xip.io is a magic domain name that provides wildcard DNS for any IP address. <http://xip.io/>

3). Grab the embed code and drop the script tags into  the head of your layout.php – these load CSS style tags that include the fonts. 

4). Then choose the fonts you want to add to your kit (the designer will have briefed you on which fonts to select).

5). You'll be taken through to your Kit page. 

In the left hand column, you can choose which weights and styles you want (e.g. Light, bold, bold italic). You can select multiple weights and styles, though bear in mind each new selection adds weight to your project.

`"Using Weights & Styles in your CSS"` - tells you how to reference the font-family, font-weight & font-styles in your CSS.    

6). Finally in "Kit Settings":  
In Mobile Settings, the various iPad, iPhone, and Android support options should be ticked. 
In Server Settings, 'Typekit Default' should be ticked - serves from use.typekit.net/ and allows SSL.
You don't need to tick any additional Colophon Settings

7). Then click `Publish` in TypeKit, to make the font available to your network. 
