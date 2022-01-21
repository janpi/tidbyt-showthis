# ShowThis - App for Tidbyt
This display app displays information it retrieves from a custom URL which can be defined in the app settings.

## Retrieval of Information
The app retrieves a JSON object with a GET request from the configured URL. Content is refreshed (URL is queried) every 10 minutes.

The JSON object has to contain the following fields:

|Field Name     |Description                    
|---------------|---------------------------------
|text_left      |Text on the upper left         
|text_right     |Text on the upper right         
|text_large     |Large text in the middle
|text_small     |Small text beneath the large text
|icon           |An icon shown next to the large text. Format GIF or PNG, ideally 13px x 13px, encoded in base64

> Note: text_left and text_right can have a combined length of 16 chars, text_large can be about 8 chars, text_small about 12 chars.
### Icon
For now, passing an icon in your JSON object is **mandatory**. If you don't have a 13x13 icon at hand, you can use the showthis_icon_example.png icon in this repo. To convert images to base64 string, you may use a website such as www.base64encode.org.   

### Example JSON object

You can use this URL for testing purposes: https://hook.integromat.com/ujwv9g2ug7budr8stcb5tvn9bjtrrb5m 

```starlark
{
    "text_left":"ShowThis",
    "text_right":"Test",
    "text_large":"23:46:15",
    "text_small":"o'clock",
    "icon":"H4m267pR1iovi3bTdN0 .... znS1HRaUxOwAAAAASUVORK5CYII="
}
```

## Visualisation

![Example of ShowThis app](showthis-example.gif)

## Todo

What's on the roadmap for this app?
- Make refresh interval (currently 10 minutes) configurable in app settings
- Accept not only a JSON object, but also a comma-separated string
- Make design (font colors, maybe font sizes) configurable
