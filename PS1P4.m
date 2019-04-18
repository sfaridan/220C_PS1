%Stefan Faridani
%4/12/2019
%Code for 220C PS1 Problem 4

%set up parameters
N=500;
its=1000;
beta=1;
%beta=314.15926; %no change
bhat = repmat(0,its,1);
sighat = repmat(0,its,1);
sigtilde = repmat(0,its,1);

%Loop over different time series lengths
for (T=[5,10,20])

for (i=1:its)
    X = normrnd(0,1,N,T);
    mu =abs(X).*normrnd(0,1,N,T); %heteroskedastic error term
    Xdemeaned = X-repmat((X*ones(T,1))/T,1,T);
    mudemeaned= mu-repmat((mu*ones(T,1))/T,1,T);
    bhat(i) = beta+ (sum(sum(Xdemeaned.^2)))^(-1)*(sum(sum(Xdemeaned.*mudemeaned))); %estimate of beta
    SXX = sum(sum(Xdemeaned.^2));
    %robust standard errors
    sighat(i)= sqrt(SXX^(-2) * sum((Xdemeaned.*mudemeaned * ones(T,1)).^2));
    sigtilde(i) = sqrt(SXX^(-2) * sum(sum(Xdemeaned.^2.*mudemeaned.^2)));
end

T
sd_bhat = std(bhat)
bias_sighat = mean(sighat) - sd_bhat
bias_sigtilde = mean(sigtilde) - sd_bhat
sd_sighat = std(sighat)
sd_sigtilde = std(sigtilde)
rmse_sighat = sqrt(mean((sighat-sd_bhat).^2))
rmse_sigtilde = sqrt(mean((sigtilde-sd_bhat).^2))
end