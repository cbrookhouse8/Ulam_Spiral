// before becoming a GitHub repository
// this file was stored locally as 
// ulam_spiral_4

int n;
int section;
int sBound;
int sign;
int threshold;
Boolean modifyX;
int sectionLength;
float spacing;
float x;
float y;

void setup() {
 size(800,800);
 background(255);
 n = 1;
 section = 1;
 sBound  = 2;
 sign = 1;
 modifyX = true;
 sectionLength = 1;
 threshold = 1;
 x = 0;
 y = 0;
 
 spacing = 6;
 
 for (int i = 0 ; i < 18000 ; i++) {
  spiral(); 
 }
}

void spiral() {
  if (n > sBound) {
   section++;
   modifyX = true;
  }
  
  if (section%2 != 0) {
   sign = 1; 
  } else {
   sign = -1; 
  }
  
    sBound = section*(section+1);
    int oldBound = (section-1)*(section);
    //[sBound for n] - [sBound for n-1]
    sectionLength = sBound-oldBound;
    
    threshold = oldBound+(sectionLength/2);
    
  if (n > threshold) {
   modifyX = false;
  }
  
    noStroke();
      pushMatrix();
        translate(width/2,height/2);
            rectMode(CENTER);
             if (checkPrime(n)) {
                 fill(203,85,255);
                 rect(x,y,spacing,spacing);
             }
      popMatrix();
    next();
}

// UTILITY FUNCTIONS

boolean checkPrime(int num) {
  Boolean prime = true;
  if (num == 1) {
   prime = false; 
  } else {
    for (int i = 2 ; i <= num/2 ; i++) {
       if (num%i == 0 && num != 2) {
        prime = false; 
       }
     }
  }
  return prime; 
}



void next() {
  if (modifyX) {
   x+=(spacing*sign); 
  } else {
   y+=(spacing*sign); 
  }   
  n++;
}