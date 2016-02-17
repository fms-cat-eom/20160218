float[] mod = new float[ 200 ];
float[] car = new float[ 200 ];
float[] out = new float[ 200 ];

PFont fontS;
PFont fontL;

void setup() {
  size( 512, 512 );
  strokeCap( ROUND );
  strokeJoin( ROUND );
  
  fontS = createFont( "HelveticaNeue-Bold", 32 );
  fontL = createFont( "HelveticaNeue-Bold", 64 );
}

void draw() {
  float time = ( frameCount / 2000.0 ) % 1;
  
  float amp = constrain( sin( time * 2.0 * PI ) + 0.8, 0.0, 1.0 );
  float freq = 1.0 + constrain( sin( time * 2.0 * PI + 4.7 ) * 0.8 + 0.5, 0.0, 1.0 ) * 3.0;
  for ( int i = 0; i < 200; i ++ ) {
    mod[ i ] = sin( -( ( time - 0.15 ) * 4 + i / 200.0 ) * freq * 2.0 * PI ) * amp;
    car[ i ] = sin( -( ( time - 0.15 ) * 4 + i / 200.0 ) * 2.0 * PI );
    float offset = mod[ i ] * 0.8;
    out[ i ] = sin( -( ( time - 0.15 ) * 4 + i / 200.0 + offset / 2.0 ) * 2.0 * PI );
  }
  
  background( 255 );
  
  // ------
  
  noFill();
  stroke( 255, 157, 0 );
  strokeWeight( 4 );
  
  beginShape();
  for ( int i = 0; i < 200; i ++ ) {
    vertex( 128 - mod[ i ] * 80.0, 228 - i );
  }
  endShape();
  
  beginShape();
  for ( int i = 0; i < 200; i ++ ) {
    vertex( 228 - i, 384 - car[ i ] * 80.0 );
  }
  endShape();
  
  beginShape();
  for ( int i = 0; i < 200; i ++ ) {
    vertex( 284 + i, 384 + out[ i ] * 80.0 );
  }
  endShape();
  
  // ------
  
  noFill();
  stroke( 127 );
  strokeWeight( 4 );
  rect( 28, 28, 200, 200 );
  rect( 28, 284, 200, 200 );
  rect( 284, 284, 200, 200 );
  
  // ------
  
  noFill();
  stroke( 255, 157, 0 );
  strokeWeight( 2 );
  ellipse( 128 - mod[ 0 ] * 80.0, 228, 12, 12 );
  line( 128 - mod[ 0 ] * 80.0, 228, 128 - mod[ 0 ] * 80.0, 384 + out[ 0 ] * 80.0 );
  ellipse( 128 - mod[ 0 ] * 80.0, 384 + out[ 0 ] * 80.0, 12, 12 );
  line( 128 - mod[ 0 ] * 80.0, 384 + out[ 0 ] * 80.0, 284, 384 + out[ 0 ] * 80.0 );
  ellipse( 284, 384 + out[ 0 ] * 80.0, 12, 12 );
  
  // ------
  
  fill( 127 );
  noStroke();
  
  textFont( fontS );
  text( "Amp", 320, 60 );
  textFont( fontL );
  text( nf( amp, 1, 2 ), 320, 115 );
  
  textFont( fontS );
  text( "Freq", 320, 160 );
  textFont( fontL );
  text( nf( freq, 1, 2 ), 320, 215 );
  
  noFill();
  stroke( 127 );
  strokeWeight( 2 );
  line( 240, 82, 310, 82 );
  line( 240, 182, 310, 182 );
  
  //saveFrame( "capture/####.png" );
  //if ( frameCount == 2000 ) { exit(); }
}