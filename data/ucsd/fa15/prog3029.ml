
let rec appZero x l = if x > 0 then l @ 0 else (appZero x) - (1 l);;
