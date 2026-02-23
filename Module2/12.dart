void main(){

  List n=[45,98,12,54,77];

  int min=n[0];
  int max=n[0];
  int l=n.length;

  findMinMax(n,min,max,l);

}

findMinMax(List<dynamic> n, int min, int max, int l) {

  for(int i=0;i<l;i++){

    if(n[i]<min){
      min=n[i];
    }
    if(n[i]>max){
      max=n[i];
    }

  }

  print("Minimum is : $min");
  print("Maximum is : $max");

}