class Z {
  Z[] points = new Z[4];
  PVector pos;
  float w;
  float h;
  boolean generated = false;
  
  Z(PVector pos, float w, float h) {
    this.pos = pos;
    this.w = w;
    this.h = h;
  }

  void generate() {
    if (generated) {
      points[0].generate();
      points[1].generate();
      points[2].generate();
      points[3].generate();
    } else {
      points[0] = new Z(new PVector(pos.x - w / 2, pos.y - h / 2), w / 2, h / 2);
      points[1] = new Z(new PVector(pos.x + w / 2, pos.y - h / 2), w / 2, h / 2);
      points[2] = new Z(new PVector(pos.x - w / 2, pos.y + h / 2), w / 2, h / 2);
      points[3] = new Z(new PVector(pos.x + w / 2, pos.y + h / 2), w / 2, h / 2);
      generated = true;
    }
  }
  
  ArrayList<PVector> getPoints() {
    ArrayList<PVector> points = new ArrayList<>();
    if (generated) {
      points.addAll(this.points[0].getPoints());
      points.addAll(this.points[1].getPoints());
      points.addAll(this.points[2].getPoints());
      points.addAll(this.points[3].getPoints());
    } else {
      points.add(pos);
    }
    return points;
  }
}

Z z;

void setup() {
  size(900, 900);
  z = new Z(new PVector(width / 2, height / 2), width / 2, height / 2);
}

void draw() {}

void mousePressed() {
  z.generate();
  background(0);
  noFill();
  stroke(255);
  beginShape();
  for (PVector p : z.getPoints()) {
    vertex(p.x, p.y);
  }
  endShape();
}
