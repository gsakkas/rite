
let rec wwhile (f,b) = if (f, b) > 100 then (f, b) else f (f, b);;
