function [TorF] = pointInTriangle(P,P1,P2,P3)
       P12 = P1-P2; P23 = P2-P3; P31 = P3-P1;
   t = sign(det([P31;P23]))*sign(det([P3-P;P23])) >= 0 & ...
       sign(det([P12;P31]))*sign(det([P1-P;P31])) >= 0 & ...
       sign(det([P23;P12]))*sign(det([P2-P;P12])) >= 0 ;
   TorF = t;
end