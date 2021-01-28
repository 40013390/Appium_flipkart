*** Settings ***
Library    AppiumLibrary    

*** Test Cases ***
  
TC2_VerifyPlaceOrder
    Open Application    http://localhost:4723/wd/hub    
    ...    platformName=android
    ...    deviceName=realme
    ...    appPackage=com.flipkart.android
    ...    appActivity=com.flipkart.android.SplashActivity
    ...    noReset=True
    #Entering into the flipkrt app selectng language as ENGLISH
    Set Appium Timeout    30s    
    Click Element    xpath=(//*[@resource-id="com.flipkart.android:id/iv_checkbox"])[6]
    Click Element    xpath=//*[@resource-id="com.flipkart.android:id/ll_select_btn"]
    #getting OTP
    Wait Until Page Contains    094913 64277    timeout=5s        
    Run Keyword And Ignore Error    Click Element    xpath=//*[@text="094913 64277"]
    
    Run Keyword And Ignore Error    Input Text    xapth=//*[@content-desc="Phone Number"]    94913 64277
    Run Keyword And Ignore Error    Click Element    xpath=//*[@text="Send OTP"]
    Sleep     20s
    #searching for product Dell laptop 10th generation
    Click Element    xpath=//*[@resource-id="com.flipkart.android:id/search_widget_textbox"]
    Input Text    xpath=//*[@resource-id="com.flipkart.android:id/search_autoCompleteTextView"]    Dell laptop i7 10th generation 
    #selecting the product from suggestions
    FOR    ${i}    IN RANGE    0    20
        ${output}    Run Keyword And Ignore Error    Click Element    xpath=//*[contains(@text,"dell laptop i7 10th generation")]  
           
        Exit For Loop If    '${OUTPUT}[0]'=='PASS'
    END
    FOR    ${i}    IN RANGE    0    20
        ${output}    Run Keyword And Ignore Error    Click Element    xpath=//*[contains(@text,"dell laptop i7 10th generation")]  
        Swipe By Percent    50    75    50    25    
        Exit For Loop If    '${OUTPUT}[0]'=='PASS'
    END
    #clicking not mow for location access
    Run Keyword And Ignore Error    Click Element    xpath=//*[@text="NOT NOW"]
    #clicking to to cart and add to cart or some times it get diplay of only add to cart in that case clicking on add to cart
    FOR    ${i}    IN RANGE    0    20
        ${output}    Run Keyword And Ignore Error    Click Element    //*[contains(@text,"GO TO CART")]  
        Run Keyword And Ignore Error    Click Element    //*[contains(@text,"ADD TO CART")]   
        Run Keyword And Ignore Error    Click Element    //*[contains(@text,"GO TO CART")]  
        Swipe By Percent    50    75    50    25    
        Exit For Loop If    '${OUTPUT}[0]'=='PASS'
     END
     #removing from the cart this is the last activity
     Click Element    xpath=//*[@class="android.view.ViewGroup"]
     Run Keyword And Ignore Error    Click Element    xpath=//*[@text="Remove"]