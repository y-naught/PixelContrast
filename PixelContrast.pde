 PImage img;
 PGraphics g;
 PImage img2;
 int dif = 0;
 int count = 0;

 void setup(){
  size(100,100, P2D);
  img = loadImage("TextureTest5.jpg");
  img2 = createImage(img.width,img.height,RGB);
  g = createGraphics(img.width, img.height, P2D);
 }

 void draw(){
  img.loadPixels();
  img2.loadPixels();
  for(int i = 0; i < img.width; i++){
   for(int j = 0; j < img.height; j++){
    
    color center = img.pixels[i + j * img.width];
    float r = red(center);
    float g = green(center);
    float b = blue(center);
    float bright = r+g+b;
    float average = 0;
    
    if(i > 2 && i < img.width - 2 && j > 2 && j < img.height - 2){
      for(int x = -2; x <=2; x++){
       for(int y = -2; y <= 2; y++){
         color c2 = img.pixels[(i+x) + (j+y) * img.width];
         float tempR = red(c2);
         float tempG = green(c2);
         float tempB = blue(c2);
         average += tempR + tempG + tempB;
       }
      }
    }
    
    average = average / 27;
    if(bright > average + dif){
      
      img2.pixels[i + j * img2.width] = color(255);

    }
    else{
      img2.pixels[i + j * img2.width] = color(0);
    }
    if(i < 2 || i > img2.width - 2 || j <2 || j > img2.height - 2){
     img2.pixels[i + j * img2.width] = color(0); 
    }
   }
  }
  
  img.updatePixels();
  img2.updatePixels();
  g.beginDraw();
  g.background(0);
  g.image(img2, 0, 0);
  g.stroke(0);
  g.text(count, g.width - (g.width / 12), g.height - (g.height / 12));
  g.endDraw();
  g.save("Texture5Contrast" + count + ".jpg");
  dif +=1;
  count++;
 }
  


void keyPressed(){
 if(key == 'u'){
   dif += 10;
 }
 if(key== 'd'){
   dif -= 10;
 }
 if(key == 's'){
   g.save("cats3Contrast" + count + ".jpg");
   count++;
 }
}