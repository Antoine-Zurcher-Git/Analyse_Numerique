

int NX = 200, NT = 1000;
float K = 0.1, L = 1, Time = 0.02;//99*0.1/(1000)*NT*L/(NX-1);//0.1 NX=100,Time=0.1  NX=200,Time=0.01  NX = 30,Time=0.5 NX = 300,Time=0.005
float dx = L/(NX-1);
float dt = Time/(NT);
float x[] = new float[NX];
float T[][] = new float[NX][NX];
float TG = 0;
float TD = 0;
float source [][][] = new float[NX][NX][3];
float period = 2*PI;

int dimSource = int(NX/20);
void setup() {
  for (int i = 0; i < NX; i += 1) {
    x[i] = i*dx;
  }
  for (int i = 0; i < NX; i += 1) {
    for (int j = 0; j < NX; j +=1) {
      T[i][j] = 0.5;//abs(sin(period*x[i])*sin(period*x[j]));
    }
  }
  //for (int i = 0; i < NX; i ++) {
  //  T[0][i] = TG;
  //  T[NX-1][i] = TD;
  //}
  size(700, 700);
  background(255);//58, 140, 210);
}

float txBarre = 700;
float tyBarre = 700;
int temps = 0;

float ra = 240, ba = 20, va = 20, rd = 50, vd = 115, bd = 245;

boolean pause = true;
void draw() {


  //println(frameRate);
  if (pause == false) {
    float Ttemp[][] = new float[NX][NX];
    //Ttemp[0] = TG;
    //Ttemp[NX-1] = TD;
    for (int i = 0; i < NX; i ++) {
      for (int j = 0; j < NX; j ++) {
        if (j == 0) {
          if (i == 0) {
            Ttemp[i][j] = T[i][j]+(K*dt/(dx*dx))*(T[i+1][j]-3*T[i][j]+T[i][j+1]    +T[i+1][j+1]);
          } else if (i  == NX -1) {
            Ttemp[i][j] = T[i][j]+(K*dt/(dx*dx))*(-3*T[i][j]+T[i-1][j]+T[i][j+1]    +T[i-1][j+1]);
          } else {
            Ttemp[i][j] = T[i][j]+(K*dt/(dx*dx))*(T[i+1][j]-5*T[i][j]+T[i-1][j]+T[i][j+1]    +T[i+1][j+1]    +T[i-1][j+1]);
          }
        } else if (j == NX-1) {
          if (i == 0) {
            Ttemp[i][j] = T[i][j]+(K*dt/(dx*dx))*(T[i+1][j]-3*T[i][j]+T[i][j-1]    +T[i+1][j-1]);
          } else if (i  == NX -1) {
            Ttemp[i][j] = T[i][j]+(K*dt/(dx*dx))*(-3*T[i][j]+T[i-1][j]+T[i][j-1]    +T[i-1][j-1]);
          } else {
            Ttemp[i][j] = T[i][j]+(K*dt/(dx*dx))*(T[i+1][j]-5*T[i][j]+T[i-1][j]+T[i][j-1]    +T[i+1][j-1]    +T[i-1][j-1]);
          }
        } else {
          if (i == 0) {
            Ttemp[i][j] = T[i][j]+(K*dt/(dx*dx))*(T[i+1][j]-5*T[i][j]+T[i][j-1]+T[i][j+1]    +T[i+1][j+1]+T[i+1][j-1]);
          } else if (i  == NX -1) {
            Ttemp[i][j] = T[i][j]+(K*dt/(dx*dx))*(-5*T[i][j]+T[i-1][j]+T[i][j-1]+T[i][j+1]    +T[i-1][j+1]+T[i-1][j-1]);
          } else {
            Ttemp[i][j] = T[i][j]+(K*dt/(dx*dx))*(T[i+1][j]-8*T[i][j]+T[i-1][j]+T[i][j-1]+T[i][j+1]    +T[i+1][j+1]+T[i+1][j-1]+T[i-1][j+1]+T[i-1][j-1]);
          }
        }
      }
    }
    for (int i = 0; i < NX; i ++) {
      for (int j = 0; j < NX; j ++) {
        if (source[i][j][0] == i && i != 0) {
          Ttemp[i][j] = source[i][j][2];
        }
      }
    }
    //T = Ttemp;
    for (int j = 0; j < NX; j ++) {
      for (int i = 0; i < NX; i ++) {
        T[i][j] = Ttemp[i][j];
      }
    }

    for (int i = 0; i < NX; i ++) {
      for (int j = 0; j < NX; j ++) {
        noStroke();//abs(T[i]*255)

        color c = color(rd+(ra-rd)*T[i][j], vd+(va-vd)*T[i][j], bd+(ba-bd)*T[i][j]);
        fill(c);//abs(T[i][j]*255));
        rect( (width-txBarre)/2+i*txBarre/NX, (height-tyBarre)/2+j*txBarre/NX, txBarre/NX, tyBarre/NX);
        //line(200+i*2, 310, 200+i*2, 390);
        //line(200+i*2+1, 310, 200+i*2+1, 390);
      }
    }
    temps ++;
    //println(temps);
  }

  //fill(255);
  //rect(0, 0, 700, (height-tyBarre)/2);
  //fill(0);
  //textSize(20);
  //text("Valeur Source : "+int(valeurSource*1000)/1000.0, 20, 30);
  //text("Précision source : "+ int(sourceP*1000)/1000.0, 20, 60);
  //text("Dimension source : "+ dimSource, 20, 90);

  if (mousePressed) {
    int xS = int((mouseX-(width/2.0-txBarre/2.0))*NX/txBarre);
    int yS = int((mouseY-(height/2.0-tyBarre/2.0))*NX/tyBarre);

    if (xS >= 0 && xS < NX && yS >= 0 && yS < NX) {
      if (mouseButton == LEFT) {
        if (xS+dimSource < NX && yS+dimSource < NX) { 
          for (int k = 0; k < dimSource; k ++) {
            for (int l = 0; l < dimSource; l ++) {
              source[xS+k][yS+l][0] = xS+k;
              source[xS+k][yS+l][1] = yS+l;
              source[xS+k][yS+l][2] = valeurSource;
              color c = color(rd+(ra-rd)*valeurSource, vd+(va-vd)*valeurSource, bd+(ba-bd)*valeurSource);
              fill(c);
              rect( (width-txBarre)/2+(xS+k)*txBarre/NX, (height-tyBarre)/2+(yS+l)*txBarre/NX, txBarre/NX, tyBarre/NX);
              
            }
          }
        }
      } else {

        if (xS+dimSource < NX && yS+dimSource < NX) { 
          for (int k = 0; k < dimSource; k ++) {
            for (int l = 0; l < dimSource; l ++) {
              source[xS+k][yS+l][0] = 0;
              source[xS+k][yS+l][1] = 0;
              source[xS+k][yS+l][2] = valeurSource;
            }
          }
        }
      }
    }
  }

  if (temps%5 == 0 && pause == false) {
    saveFrame("sortie/frames-#######.png");
  }
}

//void mouseClicked() {

//}
float valeurSource = 0;
float sourceP = 0.5;
void keyPressed() {
  if (keyCode == 38) {
    valeurSource += sourceP;
    println("Valeur Source : "+int(valeurSource*1000)/1000.0);
  } else if (keyCode == 40) {
    valeurSource -= sourceP;
    println("Valeur Source : "+int(valeurSource*1000)/1000.0);
  } else if (keyCode == 37) {
    sourceP -= 0.01;
    println("Précision source : "+ int(sourceP*1000)/1000.0);
  } else if (keyCode == 39) {
    sourceP += 0.01;
    println("Précision source : "+ int(sourceP*1000)/1000.0);
  } else if (keyCode == 80) {
    dimSource ++;
    println("Dimension source : "+ dimSource);
  } else if (keyCode == 77 && dimSource > 0) {
    dimSource --;
    println("Dimension source : "+ dimSource);
  } else if (keyCode == 32) {
    pause = !pause;
    println("pause");
  }
  //println(keyCode);
}
