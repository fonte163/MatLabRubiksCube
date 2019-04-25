function cube = turn(dir, cube)
% R, R', U, U', L, L', D, D', F, F', B, B'
switch dir
    case 1
        cube = turn_r(cube);
    case 2
        cube = reverse_turn_r(cube);
    case 3
        cube = turn_u(cube);
    case 4
        cube = reverse_turn_u(cube);
    case 5
        cube = turn_l(cube);
    case 6
        cube = reverse_turn_l(cube);
    case 7
        cube = turn_d(cube);
    case 8
        cube = reverse_turn_d(cube);
    case 9
        cube = turn_f(cube);
    case 10
        cube = reverse_turn_f(cube);
    case 11
        cube = turn_b(cube);
    case 12
        cube = reverse_turn_b(cube);
end

    function cube = turn_r(cube)
        buf1 = cube(1, 3);
        buf2 = cube(1, 4);
        buf3 = cube(1, 5);
        cube(1, 3:5) = cube(2, 3:5);
        cube(2, 3:5) = cube(6, 3:5);
        cube(6, 3:4) = cube(4, 7:8);
        cube(6, 5) = cube(4, 1);
        cube(4, 7) = buf1;
        cube(4, 8) = buf2;
        cube(4, 1) = buf3;
        for j = 1:2
            buf = cube(3,8);
            for i = 8:-1:2
                cube(3,i) = cube(3,i-1);
            end
            cube(3,1) = buf;
        end
    end

    function cube = reverse_turn_r(cube)
        buf = cube(1, 3:5);
        cube(1, 3:4) = cube(4, 7:8);
        cube(1, 5) = cube(4, 1);
        cube(4, 7:8) = cube(6, 3:4);
        cube(4, 1) = cube(6, 5);
        cube(6, 3:5) = cube(2, 3:5);
        cube(2, 3:5) = buf;
        for j = 1:2
            buf = cube(3,1);
            for i = 1:7
                cube(3,i) = cube(3,i+1);
            end
            cube(3,8) = buf;
        end
    end

    function cube = turn_u(cube)
        buf = cube(2, 1:3);
        for i = 2:4
            cube(i, 1:3) = cube(i+1, 1:3);
        end
        cube(5, 1:3) = buf;
        for a = 1:2
            buf = cube(1,8);
            for i = 8:-1:2
                cube(1,i) = cube(1,i-1);
            end
            cube(1,1) = buf;
        end
    end

    function cube = reverse_turn_u(cube)
        buf = cube(5, 1:3);
        for i = 5:-1:3
            cube(i, 1:3) = cube(i-1, 1:3);
        end
        cube(2, 1:3) = buf;
        for j = 1:2
            buf = cube(1,1);
            for i = 1:7
                cube(1,i) = cube(1,i+1);
            end
            cube(1,8) = buf;
        end
    end

    function cube = turn_l(cube)
        buf1 = cube(1, 1);
        buf2 = cube(1, 7:8);
        cube(1, 1) = cube(4, 5);
        cube(1, 7:8) = cube(4, 3:4);
        cube(4, 5) = cube(6, 1);
        cube(4, 3:4) = cube(6, 7:8);
        cube(6, 1) = cube(2, 1);
        cube(6, 7:8) = cube(2, 7:8);
        cube(2, 1) = buf1;
        cube(2, 7:8) = buf2;
        for j = 1:2
            buf = cube(5,8);
            for i = 8:-1:2
                cube(5,i) = cube(5,i-1);
            end
            cube(5,1) = buf;
        end
    end

    function cube = reverse_turn_l(cube)
        buf1 = cube(1, 1);
        buf2 = cube(1, 7:8);
        cube(1, 1) = cube(2, 1);
        cube(1, 7:8) = cube(2, 7:8);
        cube(2, 1) = cube(6, 1);
        cube(2, 7:8) = cube(6, 7:8);
        cube(6, 1) = cube(4, 5);
        cube(6, 7:8) = cube(4, 3:4);
        cube(4, 5) = buf1;
        cube(4, 3:4) = buf2;
        for j = 1:2
            buf = cube(5,1);
            for i = 1:7
                cube(5,i) = cube(5,i+1);
            end
            cube(5,8) = buf;
        end
    end

    function cube = turn_d(cube)
        buf = cube(2, 5:7);
        cube(2, 5:7) = cube(5, 5:7);
        cube(5, 5:7) = cube(4, 5:7);
        cube(4, 5:7) = cube(3, 5:7);
        cube(3, 5:7) = buf;
        for j = 1:2
            buf = cube(6,8);
            for i = 8:-1:2
                cube(6,i) = cube(6,i-1);
            end
            cube(6,1) = buf;
        end
    end

    function cube = reverse_turn_d(cube)
        buf = cube(2, 5:7);
        cube(2, 5:7) = cube(3, 5:7);
        cube(3, 5:7) = cube(4, 5:7);
        cube(4, 5:7) = cube(5, 5:7);
        cube(5, 5:7) = buf;
        for j = 1:2
            buf = cube(6,1);
            for i = 1:7
                cube(6,i) = cube(6,i+1);
            end
            cube(6,8) = buf;
        end
    end

    function cube = turn_f(cube)
        buf1 = cube(1, 7);
        buf2 = cube(1, 5:6);
        cube(1, 5:7) = cube(5, 3:5);
        cube(5, 3:5) = cube(6, 1:3);
        cube(6, 1:2) = cube(3, 7:8);
        cube(6, 3) = cube(3, 1);
        cube(3, 1) = buf1;
        cube(3, 7:8) = buf2;
        for j = 1:2
            buf = cube(2,8);
            for i = 8:-1:2
                cube(2,i) = cube(2,i-1);
            end
            cube(2,1) = buf;
        end
    end

    function cube = reverse_turn_f(cube)
        buf = cube(1, 5:7);
        cube(1, 7) = cube(3, 1);
        cube(1, 5:6) = cube(3, 7:8);
        cube(3, 1) = cube(6,3);
        cube(3,7:8) = cube(6,1:2);
        cube(6,1:3) = cube(5,3:5);
        cube(5,3:5) = buf;
        for j = 1:2
            buf = cube(2,1);
            for i = 1:7
                cube(2,i) = cube(2,i+1);
            end
            cube(2,8) = buf;
        end
    end

    function cube = turn_b(cube)
        buf1 = cube(1,1:2);
        buf2 = cube(1,3);
        cube(1,1:3) = cube(3,3:5);
        cube(3,3:5) = cube(6,5:7);
        cube(6,5:6) = cube(5,7:8);
        cube(6,7) = cube(5,1);
        cube(5,7:8) = buf1;
        cube(5,1) = buf2;
        for j = 1:2
            buf = cube(4,8);
            for i = 8:-1:2
                cube(4,i) = cube(4,i-1);
            end
            cube(4,1) = buf;
        end
    end

    function cube = reverse_turn_b(cube)
        buf = cube(1,1:3);
        cube(1,3) = cube(5,1);
        cube(1,1:2) = cube(5,7:8);
        cube(5,1) = cube(6,7);
        cube(5,7:8) = cube(6,5:6);
        cube(6,5:7) = cube(3,3:5);
        cube(3,3:5) = buf;
        for j = 1:2
            buf = cube(4,1);
            for i = 1:7
                cube(4,i) = cube(4,i+1);
            end
            cube(4,8) = buf;
        end
    end
end