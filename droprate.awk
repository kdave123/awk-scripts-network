BEGIN {
fromNode=2; toNode=3;
src1 = 0.0; dst1 = 3.0;
src2 = 1.0; dst2 = 3.1;
lineCount1 = 0;totalpackets1 = 0;
lineCount2 = 0;totalpackets2 = 0;

droppackets=0;
}
/^r/&&$3==fromNode&&$4==toNode&&$9==src1&&$10==dst1{
    totalpackets1++;

	if ( lineCount1==0 ) 
	{
	timeBegin1 = $2; lineCount1++;
	}
         else 
	{
	timeEnd1 = $2;
	};
};

/^r/&&$3==fromNode&&$4==toNode&&$9==src2&&$10==dst2{
    totalpackets2++;
	if ( lineCount2==0 )
	 {
	timeBegin2 = $2; lineCount2++;
	}
 	else
	 {
	timeEnd2 = $2;
	};
};

/^d/{
droppackets++;
};

END{
duration = timeEnd1-timeBegin1;
print" Ex. 10 sent and 2 Dropped- 2/10= 0.2 ->>> 0.2*100 = 20% packet Drop";
print " ";
print " ";
print "Transmission: source " src1 "->Destination" dst1; 
print "  - Total transmitted packets = " totalpackets1;
print "  - duration = " duration " s"; 
print " ";
duration = timeEnd2-timeBegin2;
print "Transmission: source " src2 "->Destination" dst2; 
print "  - Total transmitted Packets= " totalpackets2;
print "  - duration = " duration " s";
print " ";
print " ";
print "  - TOtal sent packets="totalpackets1+totalpackets2; 
print "  - Droped Packets   = " droppackets;

print "  - Dropped/Totalsent= " droppackets/(totalpackets1+totalpackets2)*100"% Packets Dropped"; 
}