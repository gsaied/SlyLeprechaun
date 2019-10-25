#include <iostream>
#include <cmath>
#include <math.h>
using namespace std ; 
float exponential_approx (float x ) {
	return (1+x+x*x/2) ;
}
float four_terms_approx ( float x ) {
	return (1+x+(x*x/2)+(x*x*x/6)) ;
}
float five_terms_approx ( float x ) {
	return (1+x+(x*x/2)+(x*x*x/6)+(x*x*x*x/24)) ;
}
int main (int argc , char *argv []) {
	float exact = exp(atoi(argv[1])) ;
	cout << "exact value is: " << exact <<endl ;
	cout << "aprroximated value to 3 terms is: " << exponential_approx(atoi(argv[1]))<<endl ;
	cout << "error = " << ((exact - exponential_approx(atoi(argv[1])))/exact)*100<<"%"<<endl ;
	cout << "aprroximated value to 4 terms is: " << four_terms_approx(atoi(argv[1]))<<endl ;
	cout << "error = " << ((exact - four_terms_approx(atoi(argv[1])))/exact)*100<<"%"<<endl ;
	cout << "aprroximated value to 5 terms is: " << five_terms_approx(atoi(argv[1]))<<endl ;
	cout << "error = " << ((exact - five_terms_approx(atoi(argv[1])))/exact)*100<<"%"<<endl ;
	float exp_exact, exp_approx_four ;
	float temp1 = 0 ;
	float temp2 = 0 ; 
	float temp3 = 0 ;
	for ( float i = 0.1 ; i < 2 ; i= i+0.1 ) {
		temp1 += exp(i) ;
		temp2 += four_terms_approx(i) ;
		temp3 += five_terms_approx(i) ;
	}
	cout <<"Softmax exact value output is: " << exp(1.3)/temp1 <<endl  ;
	cout <<"four terms approximation output is: "<< four_terms_approx(1.3)/temp2<<endl ; 
	cout <<"four terms error = " << ((exp(1.3)/temp1 - (four_terms_approx(1.3)/temp2)) / (exp(1.3)/temp1))*100 << endl; 
	cout <<"five terms approximation output is: "<< five_terms_approx(1.3)/temp2<<endl ; 
	cout <<"five terms error = " << ((exp(1.3)/temp1 - (five_terms_approx(1.3)/temp2)) / (exp(1.3)/temp1))*100 << endl; 
return 0 ; 
}
