BEGIN {
fromNode=2; toNode=3;
src1 = 0.0; dst1 = 3.0;
src2 = 1.0; dst2 = 3.1;
lineCount1 = 0;totalBits1 = 0;
lineCount2 = 0;totalBits2 = 0;
}
/^r/&&$3==fromNode&&$4==toNode&&$9==src1&&$10==dst1 {
    totalBits1 += 8*$6;
if ( lineCount1==0 ) {
timeBegin1 = $2; lineCount1++;
} else {
timeEnd1 = $2;
};
};
/^r/&&$3==fromNode&&$4==toNode&&$9==src2&&$10==dst2 {
    totalBits2 += 8*$6;
if ( lineCount2==0 ) {
timeBegin2 = $2; lineCount2++;
} else {
timeEnd2 = $2;
};
};
END{
duration = timeEnd1-timeBegin1;
print "Transmission: source " src1 "->Destination" dst1; 
print "  - Total transmitted bits = " totalBits1 " bits";
print "  - duration = " duration " s"; 
print "  - Thoughput = "  totalBits1/duration/1e3 " kbps."; 
print " ";
duration = timeEnd2-timeBegin2;
print "Transmission: source " src2 "->Destination" dst2; 
print "  - Total transmitted bits = " totalBits2 " bits";
print "  - duration = " duration " s"; 
print "  - Thoughput = "  totalBits2/duration/1e3 " kbps."; 
}