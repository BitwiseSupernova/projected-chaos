int T = 10000;

float px = 0;
float py = 0;
//float pz = 0;
int nowc = 0;

int P = 4;

float[] nodex = new float[P];
float[] nodey = new float[P];
float[] nodez = new float[P];
int[] cols = new int[P];

float M = 350;
float N = 70;
float tm = 0;
float tn = PI;
float dm = 0.02;
float dn = -0.01;

void setup()
{
  size(768,768,P2D);
  cols[0] = color(42, 42, 42);
  cols[1] = color(0, 255, 255);
  cols[2] = color(0x3B, 0x1A, 0xC4);
  cols[3] = color(0, 255, 255);
  frameRate(30);
}

void draw()
{
  background(0);
  
  float ph = TWO_PI / 3;
  for (int i=0; i<(P-1); i++)
  {
    nodex[i] = M * cos(i*ph + tm);
    nodey[i] = M * sin(i*ph + tm);
    nodez[i] = 0;
  }
  nodex[P-1] = N * cos(tn);
  nodey[P-1] = N * sin(tn);
  //nodez[P-1] = 0;
  tm += dm;
  tn += dn;
  
  fill(255);
  text("Four control points.\nCenter is rotating at a different rate", 20, 20);
  
  translate(width/2, height/2);
  
  beginShape(POINTS);
  for (int i=0; i<T; i++)
  {
    int t = (int)random(P);
    float tx = nodex[t];
    float ty = nodey[t];
    //float tz = nodez[t];
    int to = cols[t];
    
    nowc = lerpColor(nowc, to, 0.5);
    stroke(nowc);
    
    px = px + (tx - px)/2;
    py = py + (ty - py)/2;
    //pz = pz + (tz - pz)/2;
    vertex(px,py);
  }
  endShape();
}