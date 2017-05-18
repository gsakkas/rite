
let rec sumList xs = match sumList with | head::tail -> head + (sumList tail);;
