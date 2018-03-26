sample_size=function(C,p,E,N){
  
  z=qnorm(1-(1-C/100)/2);  
  
  
  E=E/100
  
  num=(p*(1-p)*z^2 )/E^2
  
  den=1+(p*(1-p)*z^2)/(N*E^2)
  
  ss=num/den
  
  return(ss)
  
}











