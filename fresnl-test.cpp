#include <iostream>
using std::cerr;
using std::cout;
using std::endl;
#include "cephes.h"

int main(int argc, char** argv){
  double s,c;
  if(argc<2){
    cerr << "need arg" << endl;
    return 1;
  }
  double x = atof(argv[1]);
  cout << "x = " << x << endl;
  int code = cephes_fresnl(x,&s,&c);
  cout << "s c = " << s << " " << c << endl;
  return code;
}
