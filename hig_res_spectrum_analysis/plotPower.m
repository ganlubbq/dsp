function [XdB, F] = plotPower(fftLength, equation, xMinimum, xDivision, xMaximum, yMinimum, yDivision, yMaximum)
	
	X = equation;
	F = (-fftLength/2:fftLength/2-1)/fftLength;
	
	XMag = abs(X) .^ 2;
	XdB = 10*log10(XMag);
	
	plot(F, fftshift(XdB));
	xlabel('Cycles/Sample'); 
	ylabel('Power/Cycles/Sample (dB)'); 
	xMin = xMinimum; xDiv = xDivision; xMax = xMaximum;
	yMin = yMinimum; yDiv = yDivision; yMax = yMaximum;
	axis([xMin xMax yMin yMax]);
	grid on; 
	if((isinf(xMinimum) == 0) && (isinf(xMaximum) == 0));
		ax = gca; 
		ax.XTick = xMin:xDiv:xMax;
	end	
	if((isinf(yMinimum) == 0) && (isinf(yMaximum) == 0))
		ax = gca; 
		ax.YTick = yMin:yDiv:yMax;
	end 
end