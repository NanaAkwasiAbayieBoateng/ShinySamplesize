confidence_level=function(SS,p,E,N){
  
  
  E=E/100
  
  
  
  
  z=sqrt((SS*((E^2)*N+p*(1-p)))/(p*(1-p)*N-SS));
  
  
  c=(pnorm(z)-pnorm(-z))*100
  
  return(c)
  
}








