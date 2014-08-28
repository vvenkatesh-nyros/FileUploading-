jQuery(document).ready ($) ->
  $(".lightbox_trigger").click (e) ->
    
    #prevent default action (hyperlink)
    e.preventDefault()
    
    #Get clicked link href
    image_href = $(this).attr("src")

    id_ref = $(this).attr("id")
    
    
    # 
    #        If the lightbox window HTML already exists in document,
    #        change the img src to to match the href of whatever link was clicked
    #         
    #        If the lightbox window HTML doesn't exists, create it and insert it.
    #        (This will only happen the first time around)
    #        
    if $("#lightbox").length > 0 # #lightbox exists
      
      #place href as img src value
      $("#content").html "<img src=\"" + image_href + "\" />"
      
      #show lightbox window - you could use .show('fast') for a transition
      $("#lightbox").show()
    else ##lightbox does not exist - create and insert (runs 1st time only)
      
      #create HTML markup for lightbox window
      #insert clicked link's href into img src
   
        lightbox = "<div id=\"lightbox\" >" + 
                  "<button id=\"btn\" onclick=\"remove1()\">Click to close</button>" + " <div id=\"content\">" + "<img id=\"img1\" src=\"" + image_href + "\" />" +
                    
                    "</div>"  + 
                    "<form id=\"frm\"  onload=\"myfunction()\" action=\"/sendmail\">" + "<input hidden value=\"" + image_href + "\"" + "name=\"src\"/>"+  "<input hidden value=\"" + id_ref + "\"" + "name=\"idref\"/>"+ "<br>"+"Email:<input name=\"email\"  required=\"true\" oninvalid=\"this. setCustomValidity('Email Id must not be null')\" oninput=\"setCustomValidity('')\" id=\"mail\" type=\"text\">" +"<br>"+ "Subject:"+
                    "<textarea name=\"body\"  cols=\"28\" rows=\"5\"></textarea>" + 
                    "<br>" +
                    "<input type=\"submit\"  value=\"Send\" onclick=\"load()\">" + 
                    "</form>" + 
                    "<img src=\"/assets/loading.gif\" id=\"loading\"  style=\"display:none\" >" +
                    "</div>"



      #insert lightbox HTML into page
      $("body").append lightbox
  
    return









jQuery(document).ready ($) ->
  $(".lightbox_trigger1").click (e) ->
    
    
    #prevent default action (hyperlink)
    e.preventDefault()
    
    #Get clicked link href
    image_href = $(this).attr("href")
    image_href = image_href.replace("//","/")

    id_ref = $(this).attr("id")

    
    # 
    #        If the lightbox window HTML already exists in document,
    #        change the img src to to match the href of whatever link was clicked
    #         
    #        If the lightbox window HTML doesn't exists, create it and insert it.
    #        (This will only happen the first time around)
    #        
    if $("#lightbox").length > 0 # #lightbox exists
      
      #place href as img src value
      $("#content").html "<embed src=\"" + image_href + "\" />" 
      
      #show lightbox window - you could use .show('fast') for a transition
      $("#lightbox").show()
    else ##lightbox does not exist - create and insert (runs 1st time only)
      
      #create HTML markup for lightbox window
      #insert clicked link's href into img src
      lightbox =  "<div id=\"lightbox\">" + 
                  "<button id=\"btn\" onclick=\"remove1()\">Click to close</button>" + "<div id=\"content\">"  + "<embed src=\"" + image_href + "\"" + "height=\"300px\"" + "width=\"800px\" />"+"</div>" + "<form id=\"frm\" action=\"/sendmail\">" + "<input  hidden value=\"" + image_href + "\"" + "name=\"src\"/>"+ "<input hidden value=\"" + id_ref + "\"" + "name=\"idref\"/>"+ "<br>"+"EMail:<input name=\"email\"  required
                       oninvalid=\"this. setCustomValidity('Email Id must not be null')\" oninput=\"setCustomValidity('')\" id=\"mail\" type=\"text\">" +"<br>"+ "Subject:"+"<textarea name=\"body\"  cols=\"28\" rows=\"5\"></textarea>" + "<br>" +
                  "<input type=\"submit\" onclick=\"load()\" value=\"Send\">" + "</form>"+ "<img src=\"/assets/loading.gif\" id=\"loading\"  style=\"display:none\" >"+ "</div>"


      
      #insert lightbox HTML into page
      $("body").append lightbox
    return








jQuery(document).ready ($) ->
  $(".lightbox_trigger2").click (e) ->
    
    
    #prevent default action (hyperlink)
    e.preventDefault()
    
    #Get clicked link href
    image_href = $(this).attr("href")
    image_href = image_href.replace("//","/")
    

    id_ref = $(this).attr("id")
    # 
    #        If the lightbox window HTML already exists in document,
    #        change the img src to to match the href of whatever link was clicked
    #         
    #        If the lightbox window HTML doesn't exists, create it and insert it.
    #        (This will only happen the first time around)
    #        
    if $("#lightbox").length > 0 # #lightbox exists
      
      #place href as img src value
      $("#content").html "<a href=\"" + image_href + "\"" + "type=\"application/msword\">" + "</a>"
      
      #show lightbox window - you could use .show('fast') for a transition
      $("#lightbox").show()
    else ##lightbox does not exist - create and insert (runs 1st time only)
      
      #create HTML markup for lightbox window
      #insert clicked link's href into img src
      lightbox = "<div id=\"lightbox\">" + "<button id=\"btn\" onclick=\"remove1()\">Click to close</button>" + "<div id=\"content\">"  + "<iframe src=\"http://docs.google.com/viewer?embedded=true&url=" + encodeURIComponent("http://localhost:3000" + image_href) + "\" width=\"500\" height=\"300\" style=\"border: none;margin : 0 auto; display : block;\"/></iframe>" + "<br>"+ "</div>" +"<form id=\"frm\" action=\"/sendmail\">" + "<input hidden value=\"" + image_href + "\"" + "name=\"src\"/>"+ "<input hidden value=\"" + id_ref + "\"" + "name=\"idref\"/>"+ "<br>"+"EMail:<input name=\"email\"  required
                       oninvalid=\"this. setCustomValidity('Email Id must not be null')\" oninput=\"setCustomValidity('')\" id=\"mail\" type=\"text\">" +"<br>"+ "Subject:"+"<textarea name=\"body\"  cols=\"28\" rows=\"5\"></textarea>" + "<br>" + "<input type=\"submit\" onclick=\"load()\" value=\"Send\">" + "</form>" + "<img src=\"/assets/loading.gif\" id=\"loading\"  style=\"display:none\" >"+  "</div>"
      
      #insert lightbox HTML into page
      $("body").append lightbox
    return



jQuery(document).ready ($) ->
       $("#close").click (e) ->

          #prevent default action (hyperlink)
          e.preventDefault()
          $("#mesg").hide()

    
$(".del").click ->
    res = confirm("confirm before delete?")
    if res is false
     false
    else
      $.ajax
        url: "/info"
        type: "GET"
        success: (data) ->
         $("#media").html data




 $(".del1").click ->
    res = confirm("confirm before delete?")
    if res is false
     false
    else
      $.ajax
       url: "/content"
       type: "GET"
       success: (data) ->
        $("#wrappers").html data        


$("td a#delete_user").click ->
    res = confirm("confirm before delete?")
    if res is false
     false
    else
      uname = $(this).parent("td").siblings("td#uname").text().trim()
      $.ajax
       url: "/delete_user?uname="+uname
       type: "GET"
       success: (data) ->
         $("#media").html data




  

      



  
      

jQuery(document).ready ($) ->
 $(".mailview").click (e) ->
    
    #prevent default action (hyperlink)
    e.preventDefault()
    
    #Get clicked link href
    mails = $(this).parents("td").siblings(".mail").html()

    if $("#lightbox").length > 0 # #lightbox exists
      
      #place href as img src value
      $("#content").html("<p>" + mails + "</p>")
      
      #show lightbox window - you could use .show('fast') for a transition
      $("#lightbox").show()
    else ##lightbox does not exist - create and insert (runs 1st time only)
      
      #create HTML markup for lightbox window
      #insert clicked link's href into img src
      lightbox = "<div id=\"lightbox\">" + "<button id=\"btn\" onclick=\"remove1()\">Click to close</button>" + "<div id=\"content\">" + "</div>" + "</div>"
      #insert lightbox HTML into page
      $("body").append lightbox
      $("#content").html("<h1>Viewing Emails in the order they sent</h1><p id=\"mails\">"+ mails + "</p>")
    return

jQuery(document).ready ($) ->
  $("input").blur ->
     $(this).next("p").remove()
     if $(this).val() is ""
      $(this).after " <p>This Field must not be empty</p>"
      $(this).focus()
      false


    


jQuery(document).ready ($) ->
  $(".lightbox_trigger11").click (e) ->
    
    #prevent default action (hyperlink)
    e.preventDefault()
    
    #Get clicked link href
    image_href = $(this).attr("src")

    id_ref = $(this).attr("id")
    
    
    # 
    #        If the lightbox window HTML already exists in document,
    #        change the img src to to match the href of whatever link was clicked
    #         
    #        If the lightbox window HTML doesn't exists, create it and insert it.
    #        (This will only happen the first time around)
    #        
    if $("#lightbox").length > 0 # #lightbox exists
      
      #place href as img src value
      $("#content").html "<img src=\"" + image_href + "\" />"
      
      #show lightbox window - you could use .show('fast') for a transition
      $("#lightbox").show()
    else ##lightbox does not exist - create and insert (runs 1st time only)
      
      #create HTML markup for lightbox window
      #insert clicked link's href into img src
   
        lightbox = "<div id=\"lightbox\" >" + 
                  "<button id=\"btn\" onclick=\"remove1()\">Click to close</button>" + " <div id=\"content\">" + "<img id=\"img1\" src=\"" + image_href + "\" />" +"</div>"  + "</div>"

      #insert lightbox HTML into page
      $("body").append lightbox
  
    return









jQuery(document).ready ($) ->
  $(".lightbox_trigger22").click (e) ->
    
    
    #prevent default action (hyperlink)
    e.preventDefault()
    
    #Get clicked link href
    image_href = $(this).attr("href")
    image_href = image_href.replace("//","/")

    id_ref = $(this).attr("id")

    
    # 
    #        If the lightbox window HTML already exists in document,
    #        change the img src to to match the href of whatever link was clicked
    #         
    #        If the lightbox window HTML doesn't exists, create it and insert it.
    #        (This will only happen the first time around)
    #        
    if $("#lightbox").length > 0 # #lightbox exists
      
      #place href as img src value
      $("#content").html "<embed src=\"" + image_href + "\" />" 
      
      #show lightbox window - you could use .show('fast') for a transition
      $("#lightbox").show()
    else ##lightbox does not exist - create and insert (runs 1st time only)
      
      #create HTML markup for lightbox window
      #insert clicked link's href into img src
      lightbox =  "<div id=\"lightbox\">" + 
                  "<button id=\"btn\" onclick=\"remove1()\">Click to close</button>" + "<div id=\"content\">"  + "<embed src=\"" + image_href + "\"" + "height=\"800px\"" + "width=\"1000px\" />"+"</div>" + "</div>"


      
      #insert lightbox HTML into page
      $("body").append lightbox
    return








jQuery(document).ready ($) ->
  $(".lightbox_trigger33").click (e) ->
    
    
    #prevent default action (hyperlink)
    e.preventDefault()
    
    #Get clicked link href
    image_href = $(this).attr("href")
    image_href = image_href.replace("//","/")
    

    id_ref = $(this).attr("id")
    # 
    #        If the lightbox window HTML already exists in document,
    #        change the img src to to match the href of whatever link was clicked
    #         
    #        If the lightbox window HTML doesn't exists, create it and insert it.
    #        (This will only happen the first time around)
    #        
    if $("#lightbox").length > 0 # #lightbox exists
      
      #place href as img src value
      $("#content").html "<a href=\"" + image_href + "\"" + "type=\"application/msword\">" + "</a>"
      
      #show lightbox window - you could use .show('fast') for a transition
      $("#lightbox").show()
    else ##lightbox does not exist - create and insert (runs 1st time only)
      
      #create HTML markup for lightbox window
      #insert clicked link's href into img src
      lightbox = "<div id=\"lightbox\">" + "<button id=\"btn\" onclick=\"remove1()\">Click to close</button>" + "<div id=\"content\">"  + "<iframe src=\"http://docs.google.com/viewer?embedded=true&url=" + encodeURIComponent("http://localhost:3000" + image_href) + "\" width=\"600\" height=\"500\" style=\"border: none;margin : 0 auto; display : block;\"/></iframe>" + "<br>"+ "</div>" + "</div>"
      
      #insert lightbox HTML into page
      $("body").append lightbox
    return