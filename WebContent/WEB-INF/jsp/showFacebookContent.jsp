<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://ogp.me/ns/fb#">
<head>
<title>${quizDetailsDto.tstr_headline}</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1">
<meta name="copyright" content="Copyright https://thecoderboy.com. All rights reserved.">
<meta name="title" content="${quizDetailsDto.tstr_headline}"/>
<meta name="description" content="${quizDetailsDto.tstr_content}"/>
<meta name="image" content="https://www.thecoderboy.com/dataimage/${question}/details${tstr_img_id}${tstr_date}.jpg"/>
<meta content="${quizDetailsDto.tstr_headline}" property="og:title">

<meta property="og:site_name" content="TheCoderBoy"/>
<meta property="og:type" content="website"/>
<meta property="og:url" content="https://www.thecoderboy.com/showpagecontent/${question}/${quizDetailsDto.tnum_id}/${tstr_img_id}/${tstr_date}/" />
<meta property="og:title" content="${quizDetailsDto.tstr_headline}" />
<meta property="og:description" content="${quizDetailsDto.tstr_content}" />
<meta property="og:image" content="https://www.thecoderboy.com/dataimage/${question}/details${tstr_img_id}${tstr_date}.jpg"/>
<meta property="og:image:type" content="image/jpg" />
<meta property="og:image:width" content="800" />
<meta property="og:image:height" content="420" />
<meta property="fb:app_id" content="322262071517889">

</head>
<body>
<img id="pageimage" name="details${tstr_img_id}${tstr_date}.jpg" src='${img_details}' width="100%" height="100%"/>
</body>
</html>