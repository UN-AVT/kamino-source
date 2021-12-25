cobweb<-function(df,scale,outfile){
charwidth<-5.5;
nvar<-dim(df)[2]-1;
ncat<-matrix(NA,nvar,1);
Numbers of categories per variable, and required array sizes
for (i in 1:nvar){
ncat[i,1]<-dim(table(df[i]))
}
allcat<-sum(ncat[,1]);
maxcat<-max(ncat);
x<-matrix(NA,nvar,maxcat);
y<-matrix(NA,nvar,maxcat)
z<-matrix(NA,maxcat,maxcat);
namecat<-matrix(NA,allcat,1);
ang<-matrix(NA,allcat,1);

varname<-names(df)[1:nvar];
lengthvar<-nchar(varname);
Lengths of variable category names
lname<-c(1:sum(ncat));
nnames<-1;
for (i in 1:nvar){
lname[nnames:(nnames+ncat[i]-1)]<-nchar(levels(df[,i]));
nnames<-nnames+ncat[i];
}
Preamble for Postscript file
heading=";%!
%%BoundingBox: 100 350 500 750
/smallfont
/Times-Roman findfont 12 scalefont def
/largeitfont
/Times-Italic findfont 16 scalefont def
smallfont setfont";
write(heading,outfile)
gap<-10.0;
rad<-150.0;
xnode<-9;
ynode<–2;
mthresh<-1;
noderad<-10;
width<-0.02;
pid<-pi/180.0;
Range available per variable
degs<-360.0/nvar-10.0;
d1<-0.5*gap;
yc<-550;
xc<-300;
arg<-pid*360/nvar;
Color segments
for (i in 1:nvar){
d2<-d1+degs;
locate<-paste( ’smallfont setfont 0.95 setgray ’, xc,yc);
circle<-paste(xc,yc,rad,d1,d2,’ arc closepath fill’);
write(c(locate,circle),outfile,append=TRUE);
d1<-d2+gap;
}

k<-0;
for (i in 1:nvar){
if only two categories both nodes are at centre point
if(ncat[i]==2){
k<-k+1;
ang[k] <-arg*(i-0.5);
x[i,1]<- round((rad*cos(ang[k])+xc),2);
y[i,1]<- round((rad*sin(ang[k])+yc),2);
x[i,2]<-x[i,1];
y[i,2]<-y[i,1]; k<-k+1;
ang[k]<-arg*(i-0.5);
}
With more than two categories
if(ncat[i]>2){
start<-0.5*gap+(i-1)*(degs+gap);
degbit<-degs/ncat[i];
halfdeg<-0.5*degbit;
for (j in 1:ncat[i]){
k<-k+1;
ang[k]<-(start+halfdeg+(j-1)*degbit)*pid;
x[i,j]<-round(xc+rad*cos(ang[k]),2);
y[i,j]<-round(yc+rad*sin(ang[k]),2);
}}}
udf<-matrix(unlist(df),dim(df)); print(udf); last<-nvar+1;
Squared standardized residuals
for(i in 1:(nvar-1)){
for(j in (i+1):nvar){
z<-chisq.test(xtabs(as.numeric(udf[,last])
∼udf[,i]+udf[,j],df))$stdres
zsq<-z*z
for(k in 1:ncat[i]){
for (l in 1:ncat[j]){
w<-0;
if(zsq[k,l]>4){
w<-abs(trunc(z[k,l]))*scale;
if(z[k,l]<0){
write(’0.85 setgray ,outfile,append=TRUE)
}
if(z[k,l]>0){
write(’0 setgray newpath ’,outfile,
append=TRUE)

}
write(paste(w,’ setlinewidth ’,x[i,k],y[i,k],
’ moveto ’,x[j,l],y[j,l],’ lineto stroke ’,
’ newpath ’),outfile,append=TRUE)
}}}}}
k<-0;
for (i in 1:nvar){
if(ncat[i,1]==2){
k<-k+1;
namecat[k]<-row.names(table(df[,i]))[1];
k<-k+1;
namecat[k]<-row.names(table(df[,i]))[1];
}
if(ncat[i,1]>2){
for (j in 1:ncat[i,1]){
k<-k+1;
namecat[k]<-row.names(table(df[,i]))[j];
}}}
write node names
k<-0;
for(i in 1:nvar){
for(j in 1:ncat[i]){
k<-k+1;
write(paste(’1 setlinewidth 1 setgray ’,
x[i,j],y[i,j],noderad,’ 0 360 arc fill 0 setgray ’),
outfile,append=TRUE);
xx<-x[i,j];
if(xx<xc){
xx<-xx-lname[k]*charwidth;
};
yy<-y[i,j]+ynode;
write(paste(xx,yy,’ moveto (’,namecat[k],’) show ’,
’ newpath ’), outfile,append=TRUE) };
write(paste(’largeitfont setfont ’),outfile,append=TRUE);
Write variable names
for (i in 1:nvar){
ang<-arg*(i-0.5);
xx<-round((1.15*rad*cos(ang)+xc),2);
yy<-round((1.15*rad*sin(ang)+yc),2);
if(xx>=xc){
xx<-xx-lengthvar[i]*5.5
};
if((ang>0.5*pi)&(ang<1.5*pi)){

xx<-xx-55.0
}
script=paste(xx,’ ’,yy,’ moveto (’,varname[i],’) show ’,
’ newpath’);
write(script,outfile,append=TRUE);
}
write(paste(’smallfont setfont ’),outfile,append=TRUE);
}
close=’showpage’; write(close,outfile,append=TRUE);
}