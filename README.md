# Tidbyt App ShowThis
This display app displays information it retrieves from a custom URL which can be defined in the app settings.

## Retrieval of Information
The app retrieves a JSON object with a GET request from the configured URL. The JSON object has to contain the following fields:

|Field Name     |Description                    
|---------------|---------------------------------
|text_left      |Text on the upper left         
|text_right     |Text on the upper right         
|text_large     |Large text in the middle
|text_small     |Small text beneath the large text
|icon           |An icon shown next to the large text, GIF or PNG format, encoded in base64

### Example JSON object

```starlark
{
    "text_left":"ShowThis",
    "text_right":"Test",
    "text_large":"23:46:15",
    "text_small":"o'clock"
    "icon":"H4m267pR1iovi3bTdN0/znS1HRaUxOwAAAAASUVORK5CYII=",
}
```

## Visualisation

