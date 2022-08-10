class APIEndpoints {
  static url(arg) {
    return "https://gateway.marvel.com/v1/public/$arg?ts=< time stamp >&apikey=<API key>&hash=< md5 Hash code >";
  }

  static end (arg) {
    return arg+'?ts=< time stamp >&apikey=<API key>&hash=< md5 Hash code >';
  }
}

/* 

How to get md5 hash code ????

1.  Go to : https://www.md5hashgenerator.com/
2.  In the text box, first enter your time stamp and then enter your api key
    ex. your time stamp is 1212345 and api key is jju322jj1kj38sdd9
        then your key is 1212345jju322jj1kj38sdd9
        and then click generate
3.  Copy this md5 hash code and put in to your api link
 */