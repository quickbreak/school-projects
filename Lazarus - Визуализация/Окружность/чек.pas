var ax,bx,cx,ay, by, cy, ox, oy, R:integer;
pa, pb:longint;
begin
    write('cin >> '); readln(ax, ay);
    readln(bx, by);
    readln(ox, oy);
    readln(R);
    pa:= sqr(ax-ox)+sqr(ay-oy);
    pb:= sqr(bx-ox)+sqr(by-oy);
    if (pa*pa<R*R) and (pb*pb<R*R)
    then write('Нет общих точек')
    else if (pa>=R) and (pb<=R) or (pa<=R) and (pb>=R)
    then write('Есть общие точки')
    else write('Не определено');
end.