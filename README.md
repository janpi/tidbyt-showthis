# ShowThis - Display any information you want on your Tidbyt
This display app displays information it retrieves from a custom URL which can be defined in the app settings. This means you can implement your own web services or use low-code platforms such as [Integromat](https://www.integromat.com) or [Zapier](https://www.zapier.com) to display any information you like - without having to implement a custome Tidbyt app. 

The cool thing is that Tidbyt supports adding multiple instances of an app to a single Tidbyt. This means that you can add this app multiple times, query multiple different URLs and thus display multiple different custom info screens on your Tidbyt.     

## Retrieval of Information
The app retrieves a JSON object with a GET request from the configured URL. Content is refreshed (URL is re-queried) **every 10 minutes**.

The JSON object has to contain the following fields:

|Field Name     |Description                    
|---------------|---------------------------------
|text_left      |Text on the upper left         
|text_right     |Text on the upper right         
|text_large     |Large text in the middle
|text_small     |Small text beneath the large text
|icon           |An icon shown next to the large text. Format GIF or PNG, ideally 13px x 13px, encoded in base64

> text_left and text_right can have a combined length of 16 chars, text_large can be about 8 chars, text_small about 12 chars.

### Icon

For now, passing an icon in your JSON object is **mandatory**. If you don't have a 13x13 icon at hand, you can use the [doc/showthis_icon_example.png](doc/showthis_icon_example.png) icon in this repo. To convert images to base64 string, you may use a website such as www.base64encode.org.   

### Example JSON object

```starlark
{
    "text_left":"ShowThis",
    "text_right":"Test",
    "text_large":"23:46:15",
    "text_small":"o'clock",
    "icon":"H4m267pR1iovi3bTdN0 .... znS1HRaUxOwAAAAASUVORK5CYII="
}
```

> You can use this URL for testing purposes: https://hook.integromat.com/ujwv9g2ug7budr8stcb5tvn9bjtrrb5m. Configure it as URL in the app settings or just open it with your browser to see the JSON object.

## Visualisation

![Example of ShowThis app](doc/showthis_display_example.gif)

## Todo

What's on the roadmap for this app?
- Make refresh interval (currently 10 minutes) configurable in app settings
- Accept not only a JSON object, but also a comma-separated string
- Make design (font colors, maybe font sizes) configurable
