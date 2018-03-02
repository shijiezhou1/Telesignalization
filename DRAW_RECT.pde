
class rectangles {
  int rect;
  float rect1;
  float rect2;
  float rect3; 
  int W_Padding = 30;
  int H_Padding = 30;
  float rectthick = 30;

  ////string text go here

  int ti;
  float lastTime = 0;
  float changingheart = height-50;
  float twopeopleindistance = 0;

  float sizeofheartw = 24; 
  float sizeofhearth = 20;
  float sizeofsmilew = 20;
  float sizeofsmileh = 14;
  float addheightheart = 5;

  int descriptionheight = 50;
  float relationimageheight = 250;

  float addwidthresultimg = 200;
  float eyesimagewidth = 150;
  float twofacelocationwidth = 200;

  //when the heart react to 5, it goes random
  float shakeheartx1 = random(5);
  float shakeheartx2 = random(5);
  float shakeheartx3 = random(5);
  float shakeheartx4 = random(5);
  float shakeheartx5 = random(5);
  float shakehearty = random(5);

  void moreRect() {
    fill(0, 0, 0); //black huge rectange on the right//////////////////////////////////
    noStroke();
    rect(width/2, 0, width/2, height); //right half screen
    rect(0, height/2, width/2, height/2); //refresh the left half of the screen for pieChart

    fill(0, 255, 0); //green///////////////////////////////////////////////////////////

    rect = (int)numberface();
    rect1 = (float)numberdistance();
    rect2 = (float)numberwidth();

    textFont(generaltextsize); 
    text(line_one + int(numberface()), width/2 + W_Padding, 30 + 30);
    if (numberface() == 0) {
    } else if (numberface() == 1) {  
      image(people, width/2+W_Padding, 30 + 35, 35, 35);
    } else if (numberface() >= 2) {
      image(people, width/2+W_Padding, 30 + 35, 35, 35); 
      image(people, width/2+W_Padding + W_Padding + W_Padding, 30 + 35, 35, 35);
    }
    //rect(width/2 + W_Padding, 30+30+10, rect * 100, rectthick);

    float newdistance = scalenum(rect2, 0, 400.00, 1000.00, 0);
    textFont(generaltextsize); 
    text(line_two + newdistance + "mm", width/2 + W_Padding, 30 + 30 + 30 + 30);
    //rect(width/2 + W_Padding , 30+30+30+30+10, newdistance, rectthick);

    float eyesimage_startingheight = 30+30+30+30;
    float eyesimageheigt = 40;

    if (newdistance <= 650) { 
      image(eyestoscreen1, width/2 + W_Padding, eyesimage_startingheight, eyesimagewidth, eyesimageheigt);
    } else if (newdistance > 650 && newdistance <= 702) {
      image(eyestoscreen2, width/2 + W_Padding, eyesimage_startingheight, eyesimagewidth, eyesimageheigt);
    } else if (newdistance > 702 && newdistance <= 754) {
      image(eyestoscreen3, width/2 + W_Padding, eyesimage_startingheight, eyesimagewidth, eyesimageheigt);
    } else if (newdistance > 754 && newdistance <= 806) {
      image(eyestoscreen4, width/2 + W_Padding, eyesimage_startingheight, eyesimagewidth, eyesimageheigt);
    } else if (newdistance > 806 && newdistance <= 858) {
      image(eyestoscreen5, width/2 + W_Padding, eyesimage_startingheight, eyesimagewidth, eyesimageheigt);
    } else if (newdistance > 858 && newdistance <= 910) {
      image(eyestoscreen6, width/2 + W_Padding, eyesimage_startingheight, eyesimagewidth, eyesimageheigt);
    } else if (newdistance >= 910) {
      image(eyestoscreen6, width/2 + W_Padding, eyesimage_startingheight, eyesimagewidth, eyesimageheigt);
    }

    textFont(generaltextsize); 
    text(line_three, width/2 + W_Padding, 30 + 30 + 30 + 30 + 30 + 30);
    //rect(width/2 + W_Padding, 30+30+30+30+30+30+10, rect1, rectthick);

    if (rect1 >= cam.width/2) {
      position = "Right";
      image(rightimg, width/2 + W_Padding, 30+30+30+30+30+30+5, 35, 35);
    } else if (rect1 < cam.width/2) {
      position = "Left";
      image(leftimg, width/2 + W_Padding, 30+30+30+30+30+30+5, 35, 35);
    }
    
    String number1 = String.format ("%.2f", twopeoplefar());
    textFont(generaltextsize); 
    text(line_four + number1 + "mm", width/2 + W_Padding, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30);
    //rect(width/2 + W_Padding, 30+30+30+30+30+30+30+30+10, (float)twopeoplefar(), rectthick);

    float twoface_startingheight = 30+30+30+30+30+30+30+30+5;
    
    if ((float)twopeoplefar() <= 60) { 
      image(twofacelocation1, width/2 + W_Padding, twoface_startingheight, twofacelocationwidth, 40);
    } else if ((float)twopeoplefar() > 60 && (float)twopeoplefar() <= 120) {
      image(twofacelocation2, width/2 + W_Padding, twoface_startingheight, twofacelocationwidth, 40);
    } else if ((float)twopeoplefar() > 120 && (float)twopeoplefar() <= 160) {
      image(twofacelocation3, width/2 + W_Padding, twoface_startingheight, twofacelocationwidth, 40);
    } else if ((float)twopeoplefar() > 160 && (float)twopeoplefar() <= 200) {
      image(twofacelocation4, width/2 + W_Padding, twoface_startingheight, twofacelocationwidth, 40);
    } else if ((float)twopeoplefar() > 200 && (float)twopeoplefar() <= 250) {
      image(twofacelocation5, width/2 + W_Padding, twoface_startingheight, twofacelocationwidth, 40);
    } else if ((float)twopeoplefar() > 250 && (float)twopeoplefar() <= 300) {
      image(twofacelocation6, width/2 + W_Padding, twoface_startingheight, twofacelocationwidth, 40);
    } else if ((float)twopeoplefar() > 300) {
      image(twofacelocation6, width/2 + W_Padding, twoface_startingheight, twofacelocationwidth, 40);
    }
    
    textFont(generaltextsize); 
    String number2 = String.format ("%.2f", twopeoplefar());
    String number3 = String.format ("%.2f", motionthreshold/20000);
    text(line_five + number2, width/2 + W_Padding, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30);
    text(line_six + number3 + "mm", width/2 + W_Padding, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 +30 + 30 + 10);

    //rect(width/2 + W_Padding, 30+30+30+30+30+30+30+30+30+30+30+30+10 + 10, scalenum(happylevel(), 0, 50000, 0, 100), rectthick);
    rect(width/2 + W_Padding, 30+30+30+30+30+30+30+30+30+30+30+30+10 + 10, motionthreshold/20000, rectthick);

    if (motionthreshold <= 1000000) {
      image(smileface, width/2 + W_Padding, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 15 + 10, width/sizeofsmilew, height/sizeofsmileh);
    } else if (motionthreshold > 1000000 && motionthreshold <= 1500000) {
      image(smileface, width/2 + W_Padding, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 15 + 10, width/sizeofsmilew, height/sizeofsmileh);
      image(smileface, width/2 + W_Padding +100, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 15 + 10, width/sizeofsmilew, height/sizeofsmileh);
    } else if (motionthreshold> 1500000 && motionthreshold <= 2500000) {
      image(smileface, width/2 + W_Padding, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 15 + 10, width/sizeofsmilew, height/sizeofsmileh);
      image(smileface, width/2 + W_Padding +100, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 15 + 10, width/sizeofsmilew, height/sizeofsmileh);
      image(smileface, width/2 + W_Padding+ 200, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 15 + 10, width/sizeofsmilew, height/sizeofsmileh);
    } else if (motionthreshold> 2500000 && motionthreshold <= 3500000) {
      image(smileface, width/2 + W_Padding, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 15 + 10, width/sizeofsmilew, height/sizeofsmileh);
      image(smileface, width/2 + W_Padding +100, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 15 + 10, width/sizeofsmilew, height/sizeofsmileh);
      image(smileface, width/2 + W_Padding+ 200, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 15 + 10, width/sizeofsmilew, height/sizeofsmileh);
      image(smileface, width/2 + W_Padding+ 300, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 15 + 10, width/sizeofsmilew, height/sizeofsmileh);
    } else if (motionthreshold > 3500000) {
      image(smileface, width/2 + W_Padding, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 15 + 10, width/sizeofsmilew, height/sizeofsmileh);
      image(smileface, width/2 + W_Padding +100, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 15 + 10, width/sizeofsmilew, height/sizeofsmileh);
      image(smileface, width/2 + W_Padding+ 200, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 15 + 10, width/sizeofsmilew, height/sizeofsmileh);
      image(smileface, width/2 + W_Padding+ 300, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 15 + 10, width/sizeofsmilew, height/sizeofsmileh);
      image(smileface, width/2 + W_Padding+ 400, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 15 + 10, width/sizeofsmilew, height/sizeofsmileh);
    } 


    /////////////////////////////////////////////////////////////////heart image//////////////////////////////////////////////////////////////////////////////////////////
    if (twopeoplefar() == 0) {
      //print nothing
    } else if ((float)twopeoplefar()>= 260 && (float)twopeoplefar()< 480) {
      image(heart, width/2 + W_Padding, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30+addheightheart, width/sizeofheartw, height/sizeofhearth); 

      textFont(hearttext); //oneheart ❤
      text(onehearts, width/2, height/2 + descriptionheight);
      image(Sone, width/2 + W_Padding + addwidthresultimg, height/2 + relationimageheight);
    } else if ((float)twopeoplefar()>= 210 && (float)twopeoplefar()< 260) {
      image(heart, width/2 + W_Padding, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30+addheightheart, width/sizeofheartw, height/sizeofhearth);
      image(heart, width/2 + W_Padding+ 100, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30+addheightheart, width/sizeofheartw, height/sizeofhearth);   

      textFont(hearttext); 
      text(twohearts, width/2, height/2 + descriptionheight);
      image(Sone, width/2 + W_Padding + addwidthresultimg, height/2 + relationimageheight);
    } else if ((float)twopeoplefar()>= 150 && (float)twopeoplefar()< 210) {
      image(heart, width/2 + W_Padding, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30+addheightheart, width/sizeofheartw, height/sizeofhearth);
      image(heart, width/2 + W_Padding+ 100, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30+addheightheart, width/sizeofheartw, height/sizeofhearth);
      image(heart, width/2 + W_Padding+ 200, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30+addheightheart, width/sizeofheartw, height/sizeofhearth);

      textFont(hearttext); //twostars ❤❤
      text(threehearts, width/2, height/2 + descriptionheight);
      image(Stwo, width/2 + W_Padding + addwidthresultimg, height/2 + relationimageheight);
    } else if ((float)twopeoplefar()>= 120 && (float)twopeoplefar()< 150) {
      image(heart, width/2 + W_Padding, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30+addheightheart, width/sizeofheartw, height/sizeofhearth);
      image(heart, width/2 + W_Padding+ 100, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30+addheightheart, width/sizeofheartw, height/sizeofhearth);
      image(heart, width/2 + W_Padding+ 200, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30+addheightheart, width/sizeofheartw, height/sizeofhearth);
      image(heart, width/2 + W_Padding+ 300, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30+addheightheart, width/sizeofheartw, height/sizeofhearth);

      textFont(hearttext); //threestars ❤❤❤
      text(fourhearts, width/2, height/2 + descriptionheight);
      image(Sthree, width/2 + W_Padding + addwidthresultimg, height/2 + relationimageheight);
    } else if ((float)twopeoplefar()>= 60 && (float)twopeoplefar()< 120) {
      image(heart, width/2 + W_Padding, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30+addheightheart, width/sizeofheartw, height/sizeofhearth);
      image(heart, width/2 + W_Padding+ 100, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30+addheightheart, width/sizeofheartw, height/sizeofhearth);
      image(heart, width/2 + W_Padding+ 200, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30+addheightheart, width/sizeofheartw, height/sizeofhearth);
      image(heart, width/2 + W_Padding+ 300, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30+addheightheart, width/sizeofheartw, height/sizeofhearth);

      textFont(hearttext); //fourstars ❤❤❤❤
      text(fourhearts, width/2, height/2 + descriptionheight);
      image(Sfour, width/2 + W_Padding + addwidthresultimg, height/2 + relationimageheight);
    } else if ((float)twopeoplefar()< 60) {
      image(heart, width/2 + W_Padding + shakeheartx1, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30+addheightheart + shakehearty, width/sizeofheartw, height/sizeofhearth);
      image(heart, width/2 + W_Padding + 100+shakeheartx2, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30+addheightheart+ shakehearty, width/sizeofheartw, height/sizeofhearth);
      image(heart, width/2 + W_Padding+ 200+shakeheartx3, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30+addheightheart+ shakehearty, width/sizeofheartw, height/sizeofhearth);
      image(heart, width/2 + W_Padding+ 300+shakeheartx4, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30+addheightheart+ shakehearty, width/sizeofheartw, height/sizeofhearth);
      image(heart, width/2 + W_Padding+ 400+shakeheartx5, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30+addheightheart+ shakehearty, width/sizeofheartw, height/sizeofhearth);

      textFont(hearttext); //fivestars ❤❤❤❤❤
      text(fivehearts, width/2, height/2 + descriptionheight);
      image(Sfive, width/2 + W_Padding + addwidthresultimg, height/2 + relationimageheight);
    } else {
      image(heart, width/2 + W_Padding, 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30 + 30+addheightheart, width/sizeofheartw, height/sizeofhearth);

      textFont(hearttext);
      text(onehearts, width/2, height/2 + 100);
      image(Sone, width/2 + W_Padding + addwidthresultimg, height/2 + relationimageheight);
    }

    //////////////////////////////////////////////////////////////////

    float graphictrackpoint;


    graphictrackpoint = scaleit((float)twopeoplefar(), 20, 300, 0, 850); //0 - 900 is the height of screen
    //println(graphictrackpoint);
    //if (graphictrackpoint > height -51) {
    //  graphictrackpoint = height - 51;
    //}
    //println(height);      //900
    //println(height/2+50); //500

    float graphictop = height/2 + 51; //Top of the red point
    float graphicbot = height - 51; //bot of the red point
    Ball ball;

    if (twopeoplefar() == 0) {
      graphictrackpoint=height;
      balls.add(new Ball(0, map(graphictrackpoint, 0, height, graphictop, graphicbot), ballWidth, 
        color ( 255, 0, 0)));
    } else {
      balls.add(new Ball(0, map(graphictrackpoint, 0, height, graphictop, graphicbot), ballWidth, 
        color ( 255, 0, 0)));
    }


    for (int i=0; i < balls.size(); i++) {
      ball = balls.get(i);
      ball.display(100+i); //ball startting point on the middle of screen
    }
    if (balls.size()>0)
      balls.remove(0);

    xline = new Line(50, height/2+50, 50, height-50, color(255, 255, 255)); //color does not work
    yline = new Line(50, height-50, width/2-100, height-50, color(255, 255, 255)); //color does not change
    
    //text for
    ti = 70;
    text("5", 30, height/2+50);
    text("4", 30, height/2+50 + ti * 1);
    text("3", 30, height/2+50 + ti * 2);
    text("2", 30, height/2+50 + ti * 3);
    text("1", 30, height/2+50 + ti * 4);
    text("0", 30, height/2+50 + ti * 5);
    text("Past 15 seconds: (frequency)", width/7, height-25);
  }
}