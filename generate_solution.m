function turns = generate_solution(face_color_code)
turns = [];
next_turn = 1;
face_colors = face_color_code;


yellow_edge_everything();

if (turns == -1) 
    return; 
end

refresh_face_colors();



yellow_corner_position();

if (turns == -1) 
    return; 
end

refresh_face_colors();



yellow_corner_orientation();

if (turns == -1) 
    return; 
end

refresh_face_colors();


mid_edges();

if (turns == -1) 
    return; 
end

refresh_face_colors();



white_edge_orientation();

if (turns == -1)
    return; 
end

refresh_face_colors();



white_corner_orientation();

if (turns == -1) 
    return; 
end

refresh_face_colors();



white_corner_permutation();

if (turns == -1) 
    return; 
end

refresh_face_colors();



white_edge_permutation();

if (turns == -1) 
    return; 
end


clean_up_output();








    function clean_up_output()
        mask = '(01|10|23|32|45|54|67|76|89|98|;:|:;|0000|1111|2222|3333|4444|5555|6666|7777|8888|9999|::::|;;;;)';
        buf = cell2mat(regexp(char(turns+47), mask, 'split'))-47;
        while (~isequal(turns, buf))
            turns = buf;
            buf = cell2mat(regexp(char(turns+47), mask, 'split'))-47;
        end
    end

    function return_error()
        turns = -1;
    end

    function yellow_corner_position()
        current_edge = [2 3 6]; % yrb
        if (isequal(sort([face_colors(1,1), face_colors(4,3), face_colors(5,1)]), current_edge))
            turns = [turns, 1,3,3,2];
        elseif (isequal(sort([face_colors(1,3), face_colors(3,3), face_colors(4,1)]), current_edge))
            turns = [turns, 10,3,9];
        elseif (isequal(sort([face_colors(1,5), face_colors(2,3), face_colors(3,1)]), current_edge))
            turns = [turns, 1,3,2];
        elseif (isequal(sort([face_colors(1,7), face_colors(5,3), face_colors(2,1)]), current_edge))
            turns = [turns, 1,4,2];
        elseif (isequal(sort([face_colors(4,5), face_colors(5,7), face_colors(6,7)]), current_edge))
            turns = [turns, 1,5,3,3,2,6];
        elseif (isequal(sort([face_colors(4,7), face_colors(3,5), face_colors(6,5)]), current_edge))
            turns = [turns, 10,11,3,9,12];
        elseif (isequal(sort([face_colors(2,5), face_colors(3,7), face_colors(6,3)]), current_edge))
            %do nothing
        elseif (isequal(sort([face_colors(2,7), face_colors(5,5), face_colors(6,1)]), current_edge))
            turns = [turns, 6,1,4,5,2];
        else
            return_error();
            return;
        end
        
        refresh_face_colors();
        current_edge = [3 4 6]; % ybo
        if (isequal(sort([face_colors(1,1), face_colors(4,3), face_colors(5,1)]), current_edge))
            turns = [turns, 2,3,1];
        elseif (isequal(sort([face_colors(1,3), face_colors(3,3), face_colors(4,1)]), current_edge))
            turns = [turns, 11,3,12];
        elseif (isequal(sort([face_colors(1,5), face_colors(2,3), face_colors(3,1)]), current_edge))
            turns = [turns, 11,4,12];
        elseif (isequal(sort([face_colors(1,7), face_colors(5,3), face_colors(2,1)]), current_edge))
            turns = [turns, 11,3,3,12];
        elseif (isequal(sort([face_colors(4,5), face_colors(5,7), face_colors(6,7)]), current_edge))
            turns = [turns, 2,5,3,1,6];
        elseif (isequal(sort([face_colors(4,7), face_colors(3,5), face_colors(6,5)]), current_edge))
            %do nothing
        elseif (isequal(sort([face_colors(2,5), face_colors(3,7), face_colors(6,3)]), current_edge))
            turns = [turns, 11,10,4,12,9];
        elseif (isequal(sort([face_colors(2,7), face_colors(5,5), face_colors(6,1)]), current_edge))
            turns = [turns, 2,6,3,3,1,5];
        else
            return_error();
            return;
        end
        
        refresh_face_colors();
        current_edge = [4 5 6]; % yog
        if (isequal(sort([face_colors(1,1), face_colors(4,3), face_colors(5,1)]), current_edge))
            turns = [turns, 5,3,6];
        elseif (isequal(sort([face_colors(1,3), face_colors(3,3), face_colors(4,1)]), current_edge))
            turns = [turns, 5,4,6];
        elseif (isequal(sort([face_colors(1,5), face_colors(2,3), face_colors(3,1)]), current_edge))
            turns = [turns, 5,3,3,6];
        elseif (isequal(sort([face_colors(1,7), face_colors(5,3), face_colors(2,1)]), current_edge))
            turns = [turns, 12,3,11];
        elseif (isequal(sort([face_colors(4,5), face_colors(5,7), face_colors(6,7)]), current_edge))
            %do nothing
        elseif (isequal(sort([face_colors(4,7), face_colors(3,5), face_colors(6,5)]), current_edge))
            turns = [turns, 2,5,4,1,6];
        elseif (isequal(sort([face_colors(2,5), face_colors(3,7), face_colors(6,3)]), current_edge))
            turns = [turns, 1,5,3,3,2,6];
        elseif (isequal(sort([face_colors(2,7), face_colors(5,5), face_colors(6,1)]), current_edge))
            turns = [turns, 9,12,3,10,11];
        else
            return_error();
            return;
        end
        
        refresh_face_colors();
        current_edge = [2 5 6]; % ygr
        if (isequal(sort([face_colors(1,1), face_colors(4,3), face_colors(5,1)]), current_edge))
            turns = [turns, 9,4,10];
        elseif (isequal(sort([face_colors(1,3), face_colors(3,3), face_colors(4,1)]), current_edge))
            turns = [turns, 9,3,3,10];
        elseif (isequal(sort([face_colors(1,5), face_colors(2,3), face_colors(3,1)]), current_edge))
            turns = [turns, 6,3,5];
        elseif (isequal(sort([face_colors(1,7), face_colors(5,3), face_colors(2,1)]), current_edge))
            turns = [turns, 9,3,10];
        elseif (isequal(sort([face_colors(4,5), face_colors(5,7), face_colors(6,7)]), current_edge))
            turns = [turns, 9,12,4,10,11];
        elseif (isequal(sort([face_colors(4,7), face_colors(3,5), face_colors(6,5)]), current_edge))
            turns = [turns, 2,6,3,3,1,5];
        elseif (isequal(sort([face_colors(2,5), face_colors(3,7), face_colors(6,3)]), current_edge))
            turns = [turns, 1,6,3,2,5];
        elseif (isequal(sort([face_colors(2,7), face_colors(5,5), face_colors(6,1)]), current_edge))
            %do nothing
        else
            return_error();
            return;
        end
    end

    function yellow_corner_orientation()
        % yrb
        if (face_colors(2,5) == 6)
            turns = [turns, 10,4,9,3,10,4,9];
        elseif (face_colors(3,7) == 6)
            turns = [turns, 1,3,2,4,1,3,2];
        elseif (face_colors(6,3) == 6)
            %do nothing
        else
            return_error;
            return;
        end
        % ybo
        if (face_colors(3,5) == 6)
            turns = [turns, 2,4,1,3,2,4,1];
        elseif (face_colors(4,7) == 6)
            turns = [turns, 11,3,12,4,11,3,12];
        elseif (face_colors(6,5) == 6)
            %do nothing
        else
            return_error;
            return;
        end
        % yog
        if (face_colors(4,5) == 6)
            turns = [turns, 12,4,11,3,12,4,11];
        elseif (face_colors(5,7) == 6)
            turns = [turns, 5,3,6,4,5,3,6];
        elseif (face_colors(6,7) == 6)
            %do nothing
        else
            return_error;
            return;
        end
        % ygr
        if (face_colors(5,5) == 6)
            turns = [turns, 6,4,5,3,6,4,5];
        elseif (face_colors(2,7) == 6)
            turns = [turns, 9,3,10,4,9,3,10];
        elseif (face_colors(6,1) == 6)
            %do nothing
        else
            return_error;
            return;
        end
    end

    function yellow_edge_everything()
        % ry edge
        for i = 1:6
            for j = 2:2:8
                if (face_colors(i,j) == 6)
                    [k,l] = get_adjacent_edge_position(i,j);
                    if (face_colors(k,l) == 2)
                        switch i
                            case 1
                                switch k
                                    case 2
                                        turns = [turns, 9,9];
                                    case 3
                                        turns = [turns, 3,9,9];
                                    case 4
                                        turns = [turns, 3,3,9,9];
                                    case 5
                                        turns = [turns, 4,9,9];
                                end
                            case 2
                                switch j
                                    case 2
                                        turns = [turns, 9,1,3,2,9,9];
                                    case 4
                                        turns = [turns, 1,3,2,9,9];
                                    case 6
                                        turns = [turns, 10,1,3,2,9,9];
                                    case 8
                                        turns = [turns, 6,4,5,9,9];
                                end
                            case 3
                                switch j
                                    case 2
                                        turns = [turns, 2,9,1];
                                    case 4
                                        turns = [turns, 1,1,9,1,1];
                                    case 6
                                        turns = [turns, 1,9];
                                    case 8
                                        turns = [turns, 9];
                                end
                            case 4
                                switch j
                                    case 2
                                        turns = [turns, 3,2,9,1];
                                    case 4
                                        turns = [turns, 5,4,6,9,9];
                                    case 6
                                        turns = [turns, 11,2,3,1,9,9];
                                    case 8
                                        turns = [turns, 2,3,1,9,9];
                                end
                            case 5
                                switch j
                                    case 2
                                        turns = [turns, 5,10,6];
                                    case 4
                                        turns = [turns, 10];
                                    case 6
                                        turns = [turns, 6,10];
                                    case 8
                                        turns = [turns, 5,5,10,5,5];
                                end
                            case 6
                                switch k
                                    case 2
                                        %do nothing
                                    case 3
                                        turns = [turns, 1,1,3,9,9];
                                    case 4
                                        turns = [turns, 11,11,3,3,9,9];
                                    case 5
                                        turns = [turns, 5,5,4,9,9];
                                end
                        end
                    end
                end
            end
        end
        
        refresh_face_colors();
        % by edge
        for i = 1:6
            for j = 2:2:8
                if (face_colors(i,j) == 6)
                    [k,l] = get_adjacent_edge_position(i,j);
                    if (face_colors(k,l) == 3)
                        switch i
                            case 1
                                switch k
                                    case 2
                                        turns = [turns, 4,1,1];
                                    case 3
                                        turns = [turns, 1,1];
                                    case 4
                                        turns = [turns, 3,1,1];
                                    case 5
                                        turns = [turns, 3,3,1,1];
                                end
                            case 2
                                switch j
                                    case 2
                                        turns = [turns, 9,2,10];
                                    case 4
                                        turns = [turns, 2];
                                    case 6
                                        turns = [turns, 10,2];
                                    case 8
                                        turns = [turns, 9,9,2,9,9];
                                end
                            case 3
                                switch j
                                    case 2
                                        turns = [turns, 2,10,4,9,1,1];
                                    case 4
                                        turns = [turns, 11,3,12,1,1];
                                    case 6
                                        turns = [turns, 1,10,4,9,1,1];
                                    case 8
                                        turns = [turns, 10,4,9,1,1];
                                end
                            case 4
                                switch j
                                    case 2
                                        turns = [turns, 12,1,11];
                                    case 4
                                        turns = [turns, 11,11,1,11,11];
                                    case 6
                                        turns = [turns, 11,1];
                                    case 8
                                        turns = [turns, 1];
                                end
                            case 5
                                switch j
                                    case 2
                                        turns = [turns, 4,9,2,10];
                                    case 4
                                        turns = [turns, 9,4,10,1,1];
                                    case 6
                                        turns = [turns, 6,9,4,10,1,1];
                                    case 8
                                        turns = [turns, 12,3,11,1,1];
                                end
                            case 6
                                switch k
                                    case 2
                                        turns = [turns, 9,9,4,1,1];
                                    case 3
                                        %do nothing
                                    case 4
                                        turns = [turns, 11,11,3,1,1];
                                    case 5
                                        turns = [turns, 5,5,3,3,1,1];
                                end
                        end
                    end
                end
            end
        end
        
        refresh_face_colors();
        % oy edge
        for i = 1:6
            for j = 2:2:8
                if (face_colors(i,j) == 6)
                    [k,l] = get_adjacent_edge_position(i,j);
                    if (face_colors(k,l) == 4)
                        switch i
                            case 1
                                switch k
                                    case 2
                                        turns = [turns, 3,3,11,11];
                                    case 3
                                        turns = [turns, 4,11,11];
                                    case 4
                                        turns = [turns, 11,11];
                                    case 5
                                        turns = [turns, 3,11,11];
                                end
                            case 2
                                switch j
                                    case 2
                                        turns = [turns, 4,1,12,2];
                                    case 4
                                        turns = [turns, 1,4,2,11,11];
                                    case 6
                                        turns = [turns, 10,1,4,2,11,11];
                                    case 8
                                        turns = [turns, 6,3,5,11,11];
                                end
                            case 3
                                switch j
                                    case 2
                                        turns = [turns, 1,12,2];
                                    case 4
                                        turns = [turns, 12];
                                    case 6
                                        turns = [turns, 2,12];
                                    case 8
                                        turns = [turns, 1,1,12,1,1];
                                end
                            case 4
                                switch j
                                    case 2
                                        turns = [turns, 3,1,12,2];
                                    case 4
                                        turns = [turns, 5,3,6,11,11];
                                    case 6
                                        turns = [turns, 12,5,3,6,11,11];
                                    case 8
                                        turns = [turns, 2,4,1,11,11];
                                end
                            case 5
                                switch j
                                    case 2
                                        turns = [turns, 6,11,5];
                                    case 4
                                        turns = [turns, 5,5,11,5,5];
                                    case 6
                                        turns = [turns, 5,11,6];
                                    case 8
                                        turns = [turns, 11];
                                end
                            case 6
                                switch k
                                    case 2
                                        turns = [turns, 9,9,3,3,11,11];
                                    case 3
                                        turns = [turns, 1,1,4,11,11];
                                    case 4
                                        %do nothing
                                    case 5
                                        turns = [turns, 5,5,3,11,11];
                                end
                        end
                    end
                end
            end
        end
        
        refresh_face_colors();
        % gy edge
        for i = 1:6
            for j = 2:2:8
                if (face_colors(i,j) == 6)
                    [k,l] = get_adjacent_edge_position(i,j);
                    if (face_colors(k,l) == 5)
                        switch i
                            case 1
                                switch k
                                    case 2
                                        turns = [turns, 3,5,5];
                                    case 3
                                        turns = [turns, 3,3,5,5];
                                    case 4
                                        turns = [turns, 4,5,5];
                                    case 5
                                        turns = [turns, 5,5];
                                end
                            case 2
                                switch j
                                    case 2
                                        turns = [turns, 10,5,9];
                                    case 4
                                        turns = [turns, 9,9,5,9,9];
                                    case 6
                                        turns = [turns, 9,5];
                                    case 8
                                        turns = [turns, 5];
                                end
                            case 3
                                switch j
                                    case 2
                                        turns = [turns, 3,10,5,9];
                                    case 4
                                        turns = [turns, 11,4,12,5,5];
                                    case 6
                                        turns = [turns, 1,10,3,9,5,5];
                                    case 8
                                        turns = [turns, 10,3,9,5,5];
                                end
                            case 4
                                switch j
                                    case 2
                                        turns = [turns, 11,6,12];
                                    case 4
                                        turns = [turns, 6];
                                    case 6
                                        turns = [turns, 12,6];
                                    case 8
                                        turns = [turns, 11,11,6,11,11];
                                end
                            case 5
                                switch j
                                    case 2
                                        turns = [turns, 3,11,6,12];
                                    case 4
                                        turns = [turns, 9,3,10,5,5];
                                    case 6
                                        turns = [turns, 6,9,3,10,5,5];
                                    case 8
                                        turns = [turns, 12,4,11,5,5];
                                end
                            case 6
                                switch k
                                    case 2
                                        turns = [turns, 9,9,3,5,5];
                                    case 3
                                        turns = [turns, 1,1,3,3,5,5];
                                    case 4
                                        turns = [turns, 11,11,4,5,5];
                                    case 5
                                        %do nothing
                                end
                        end
                    end
                end
            end
        end
    end

    function [k,l] = get_adjacent_edge_position(i,j)
        switch i
            case 1
                switch j
                    case 2
                        k = 4;
                        l = 2;
                    case 4
                        k = 3;
                        l = 2;
                    case 6
                        k = 2;
                        l = 2;
                    case 8
                        k = 5;
                        l = 2;
                end
            case 2
                switch j
                    case 2
                        k = 1;
                        l = 6;
                    case 4
                        k = 3;
                        l = 8;
                    case 6
                        k = 6;
                        l = 2;
                    case 8
                        k = 5;
                        l = 4;
                end
            case 3
                switch j
                    case 2
                        k = 1;
                        l = 4;
                    case 4
                        k = 4;
                        l = 8;
                    case 6
                        k = 6;
                        l = 4;
                    case 8
                        k = 2;
                        l = 4;
                end
            case 4
                switch j
                    case 2
                        k = 1;
                        l = 2;
                    case 4
                        k = 5;
                        l = 8;
                    case 6
                        k = 6;
                        l = 6;
                    case 8
                        k = 3;
                        l = 4;
                end
            case 5
                switch j
                    case 2
                        k = 1;
                        l = 8;
                    case 4
                        k = 2;
                        l = 8;
                    case 6
                        k = 6;
                        l = 8;
                    case 8
                        k = 4;
                        l = 4;
                end
            case 6
                switch j
                    case 2
                        k = 2;
                        l = 6;
                    case 4
                        k = 3;
                        l = 6;
                    case 6
                        k = 4;
                        l = 6;
                    case 8
                        k = 5;
                        l = 6;
                end
        end
    end

    function mid_edges()
        for i = 1:6
            for j = 2:2:8
                if (face_colors(i,j) == 2)
                    [k,l] = get_adjacent_edge_position(i,j);
                    if (face_colors(k,l) == 3)
                        %move edge
                        switch i
                            case 1
                                switch j
                                    case 2
                                        turns = [turns, 10,4,9,3,1,3,2];
                                    case 4
                                        turns = [turns, 4,10,4,9,3,1,3,2];
                                    case 6
                                        turns = [turns, 3,3,10,4,9,3,1,3,2];
                                    case 8
                                        turns = [turns, 3,10,4,9,3,1,3,2];
                                    otherwise
                                        return_error;
                                        return;
                                end
                            case 2
                                switch j
                                    case 2
                                        turns = [turns, 3,1,3,2,4,10,4,9];
                                    case 4
                                        %do nothing
                                    case 8
                                        turns = [turns, 9,3,10,4,6,4,5,3,3,1,3,2,4,10,4,9];
                                    otherwise
                                        return_error;
                                        return;
                                end
                            case 3
                                switch j
                                    case 2
                                        turns = [turns, 3,3,1,3,2,4,10,4,9];
                                    case 4
                                        turns = [turns, 2,4,1,3,11,3,12,3,1,3,2,4,10,4,9];
                                    case 8
                                        turns = [turns, 1,3,2,4,10,4,9,4,1,3,2,4,10,4,9];
                                    otherwise
                                        return_error;
                                        return;
                                end
                            case 4
                                switch j
                                    case 2
                                        turns = [turns, 4,1,3,2,4,10,4,9];
                                    case 4
                                        turns = [turns, 12,4,11,3,5,3,6,4,4,1,3,2,4,10,4,9];
                                    case 8
                                        turns = [turns, 11,3,12,4,2,4,1,1,3,2,4,10,4,9];
                                    otherwise
                                        return_error;
                                        return;
                                end
                            case 5
                                switch j
                                    case 2
                                        turns = [turns, 1,3,2,4,10,4,9];
                                    case 4
                                        turns = [turns, 6,4,5,3,9,3,10,4,1,3,2,4,10,4,9];
                                    case 8
                                        turns = [turns, 5,3,6,4,12,4,11,3,1,3,2,4,10,4,9];
                                    otherwise
                                        return_error;
                                        return;
                                end
                            otherwise
                                return_error;
                                return;
                        end
                    end
                end
            end
        end
        refresh_face_colors();
        for i = 1:6
            for j = 2:2:8
                if (face_colors(i,j) == 3)
                    [k,l] = get_adjacent_edge_position(i,j);
                    if (face_colors(k,l) == 4)
                        %move edge
                        switch i
                            case 1
                                switch j
                                    case 8
                                        turns = [turns, 2,4,1,3,11,3,12];
                                    case 2
                                        turns = [turns, 4,2,4,1,3,11,3,12];
                                    case 4
                                        turns = [turns, 3,3,2,4,1,3,11,3,12];
                                    case 6
                                        turns = [turns, 3,2,4,1,3,11,3,12];
                                    otherwise
                                        return_error;
                                        return;
                                end
                            case 3
                                switch j
                                    case 2
                                        turns = [turns, 3,11,3,12,4,2,4,1];
                                    case 4
                                        %do nothing
                                    case 8
                                        turns = [turns, 1,3,2,4,10,4,9,3,3,11,3,12,4,2,4,1];
                                    otherwise
                                        return_error;
                                        return;
                                end
                            case 4
                                switch j
                                    case 2
                                        turns = [turns, 3,3,11,3,12,4,2,4,1];
                                    case 4
                                        turns = [turns, 12,4,11,3,5,3,6,3,11,3,12,4,2,4,1];
                                    case 8
                                        turns = [turns, 11,3,12,4,2,4,1,4,11,3,12,4,2,4,1];
                                    otherwise
                                        return_error;
                                        return;
                                end
                            case 5
                                switch j
                                    case 2
                                        turns = [turns, 4,11,3,12,4,2,4,1];
                                    case 4
                                        turns = [turns, 6,4,5,3,9,3,10,4,4,11,3,12,4,2,4,1];
                                    case 8
                                        turns = [turns, 5,3,6,4,12,4,11,11,3,12,4,2,4,1];
                                    otherwise
                                        return_error;
                                        return;
                                end
                            case 2
                                switch j
                                    case 2
                                        turns = [turns, 11,3,12,4,2,4,1];
                                    case 4
                                        turns = [turns, 10,4,9,3,1,3,2,4,11,3,12,4,2,4,1];
                                    case 8
                                        turns = [turns, 9,3,10,4,6,4,5,3,11,3,12,4,2,4,1];
                                    otherwise
                                        return_error;
                                        return;
                                end
                            otherwise
                                return_error;
                                return;
                        end
                    end
                end
            end
        end
        refresh_face_colors();
        for i = 1:6
            for j = 2:2:8
                if (face_colors(i,j) == 4)
                    [k,l] = get_adjacent_edge_position(i,j);
                    if (face_colors(k,l) == 5)
                        %move edge
                        switch i
                            case 1
                                switch j
                                    case 6
                                        turns = [turns, 12,4,11,3,5,3,6];
                                    case 8
                                        turns = [turns, 4,12,4,11,3,5,3,6];
                                    case 2
                                        turns = [turns, 3,3,12,4,11,3,5,3,6];
                                    case 4
                                        turns = [turns, 3,12,4,11,3,5,3,6];
                                    otherwise
                                        return_error;
                                        return;
                                end
                            case 4
                                switch j
                                    case 2
                                        turns = [turns, 3,5,3,6,4,12,4,11];
                                    case 4
                                        %do nothing
                                    case 8
                                        turns = [turns, 11,3,12,4,2,4,1,3,3,5,3,6,4,12,4,11];
                                    otherwise
                                        return_error;
                                        return;
                                end
                            case 5
                                switch j
                                    case 2
                                        turns = [turns, 3,3,5,3,6,4,12,4,11];
                                    case 4
                                        turns = [turns, 9,3,10,4,6,4,5,3,12,4,11,3,5,3,6,4]; %5,4,6,3,9,3,10,3,5,3,6,4,12,4,11
                                    case 8
                                        turns = [turns, 5,3,6,4,12,4,11,4,5,3,6,4,12,4,11];
                                    otherwise
                                        return_error;
                                        return;
                                end
                            case 2
                                switch j
                                    case 2
                                        turns = [turns, 4,5,3,6,4,12,4,11];
                                    case 4
                                        turns = [turns, 10,4,9,3,1,3,2,4,4,5,3,6,4,12,4,11];
                                    case 8
                                        turns = [turns, 6,4,5,3,9,3,10,4,4,12,4,11,3,5,3,6,4];%9,3,10,4,5,4,6,6,3,5,4,12,4,11
                                    otherwise
                                        return_error;
                                        return;
                                end
                            case 3
                                switch j
                                    case 2
                                        turns = [turns, 5,3,6,4,12,4,11];
                                    case 4
                                        turns = [turns, 2,4,1,3,11,3,12,4,5,3,6,4,12,4,11];
                                    case 8
                                        turns = [turns, 1,3,2,4,10,4,9,3,5,3,6,4,12,4,11];
                                    otherwise
                                        return_error;
                                        return;
                                end
                            otherwise
                                return_error;
                                return;
                        end
                    end
                end
            end
        end
        refresh_face_colors();
        for i = 1:6
            for j = 2:2:8
                if (face_colors(i,j) == 5)
                    [k,l] = get_adjacent_edge_position(i,j);
                    if (face_colors(k,l) == 2)
                        %move edge
                        switch i
                            case 1
                                switch j
                                    case 4
                                        turns = [turns, 6,4,5,3,9,3,10];
                                    case 6
                                        turns = [turns, 4,6,4,5,3,9,3,10];
                                    case 8
                                        turns = [turns, 3,3,6,4,5,3,9,3,10];
                                    case 2
                                        turns = [turns, 3,6,4,5,3,9,3,10];
                                    otherwise
                                        return_error;
                                        return;
                                end
                            case 5
                                switch j
                                    case 2
                                        turns = [turns, 3,9,3,10,4,6,4,5,3]; %3,9,3,10,4,5,4,6
                                    case 4
                                        %do nothing
                                    case 8
                                        turns = [turns, 5,3,6,4,12,4,11,3,3,9,3,10,4,6,4,5];
                                    otherwise
                                        return_error;
                                        return;
                                end
                            case 2
                                switch j
                                    case 2
                                        turns = [turns, 3,3,9,3,10,4,6,4,5];
                                    case 4
                                        turns = [turns, 9,4,10,3,1,3,2,3,9,3,10,4,6,4,5];
                                    case 8
                                        turns = [turns, 9,3,10,4,6,4,5,4,9,3,10,4,6,4,5];
                                    otherwise
                                        return_error;
                                        return;
                                end
                            case 3
                                switch j
                                    case 2
                                        turns = [turns, 4,9,3,10,4,6,4,5];
                                    case 4
                                        turns = [turns, 2,4,1,3,11,3,12,4,4,9,3,10,4,6,4,5];
                                    case 8
                                        turns = [turns, 1,3,2,4,9,4,10,10,3,9,4,6,4,5];
                                    otherwise
                                        return_error;
                                        return;
                                end
                            case 4
                                switch j
                                    case 2
                                        turns = [turns, 9,3,10,4,6,4,5];
                                    case 4
                                        turns = [turns, 12,4,11,3,5,3,6,4,9,3,10,4,6,4,5];
                                    case 8
                                        turns = [turns, 11,3,12,4,6,4,1,3,9,3,10,4,6,4,5];
                                    otherwise
                                        return_error;
                                        return;
                                end
                            otherwise
                                return_error;
                                return;
                        end
                    end
                end
            end
        end
    end

    function white_edge_permutation()
        white_edges = zeros(1,4);
        for i = 1:4
            [k, l] = get_adjacent_edge_position(1,i*2);
            if (face_colors(k, l) == 4)
                white_edges(i) = 1;
            elseif (face_colors(k, l) == 3)
                white_edges(i) = 2;
            elseif (face_colors(k, l) == 2)
                white_edges(i) = 3;
            elseif (face_colors(k, l) == 5)
                white_edges(i) = 4;
            else
                return_error;
                return;
            end
        end
        
        if isequal(white_edges, [1 2 3 4])
            %do nothing
        elseif isequal(white_edges, [3 4 1 2])
            turns = [turns, 1,3,3,2,4,2,4,1,1,4,1,1,3,3,1,1,3,3,2,3];
        elseif isequal(white_edges, [4 3 2 1])
            turns = [turns, 4,2,9,1,10,12,1,9,12,1,10,2,11,11];
        elseif isequal(white_edges, [2 1 4 3])
            turns = [turns, 3,4,2,9,1,10,12,1,9,12,1,10,2,11,11,4];
            
        elseif isequal(white_edges, [1 4 2 3])
            turns = [turns, 1,4,1,3,1,3,1,4,2,4,1,1];
        elseif isequal(white_edges, [4 2 1 3])
            turns = [turns, 9,4,9,3,9,3,9,4,10,4,9,9];
        elseif isequal(white_edges, [4 1 3 2])
            turns = [turns, 5,4,5,3,5,3,5,4,6,4,5,5];
        elseif isequal(white_edges, [3 1 2 4])
            turns = [turns, 11,4,11,3,11,3,11,4,12,4,11,11];
            
        elseif isequal(white_edges, [1 3 4 2])
            turns = [turns, 1,1,3,1,3,2,4,2,4,2,3,2];
        elseif isequal(white_edges, [3 2 4 1])
            turns = [turns, 9,9,3,9,3,10,4,10,4,10,3,10];
        elseif isequal(white_edges, [2 4 3 1])
            turns = [turns, 5,5,3,5,3,6,4,6,4,6,3,6];
        elseif isequal(white_edges, [2 3 1 4])
            turns = [turns, 11,11,3,11,3,12,4,12,4,12,3,12];
        else
            return_error;
            return;
        end
    end

    function white_corner_permutation()
        white_corners = zeros(1,4);
        for i = [4 3 2 5]
            if i ~= 5
                j = i+1;
            else
                j = 2;
            end
            switch i
                case 4
                    k = 1;
                case 3
                    k = 2;
                case 2
                    k = 3;
                case 5
                    k = 4;
            end
            if (face_colors(i,3) == 4 && face_colors(j,1) == 5)
                white_corners(k) = 1;
            elseif (face_colors(i,3) == 3 && face_colors(j,1) == 4)
                white_corners(k) = 2;
            elseif (face_colors(i,3) == 2 && face_colors(j,1) == 3)
                white_corners(k) = 3;
            elseif (face_colors(i,3) == 5 && face_colors(j,1) == 2)
                white_corners(k) = 4;
            else
                return_error;
                return;
            end
        end
        
        
        if isequal(white_corners, [1 2 3 4])
            %do nothing
        elseif isequal(white_corners, [2 3 4 1])
            turns = [turns, 3];
        elseif isequal(white_corners, [3 4 1 2])
            turns = [turns, 3,3];
        elseif isequal(white_corners, [4 1 2 3])
            turns = [turns, 4];
            
        elseif isequal(white_corners, [1 4 3 2])
            turns = [turns, 6,2,12,5,10,6,11,5,1,12,2,9,1,11,3];
        elseif isequal(white_corners, [4 3 2 1])
            turns = [turns, 6,2,12,5,10,6,11,5,1,12,2,9,1,11];
        elseif isequal(white_corners, [3 2 1 4])
            turns = [turns, 6,2,12,5,10,6,11,5,1,12,2,9,1,11,4];
        elseif isequal(white_corners, [2 1 4 3])
            turns = [turns, 6,2,12,5,10,6,11,5,1,12,2,9,1,11,3,3];
            
        elseif isequal(white_corners, [3 2 4 1])
            turns = [turns, 6,11,6,9,9,5,12,6,9,9,5,5];
        elseif isequal(white_corners, [4 3 1 2])
            turns = [turns, 6,11,6,9,9,5,12,6,9,9,5,5,3];
        elseif isequal(white_corners, [2 1 3 4])
            turns = [turns, 6,11,6,9,9,5,12,6,9,9,5,5,4];
        elseif isequal(white_corners, [1 4 2 3])
            turns = [turns, 6,11,6,9,9,5,12,6,9,9,5,5,3,3];
            
        elseif isequal(white_corners, [4 1 3 2])
            turns = [turns, 3,3,6,11,6,9,9,5,12,6,9,9,5,5];
        elseif isequal(white_corners, [1 2 4 3])
            turns = [turns, 3,3,6,11,6,9,9,5,12,6,9,9,5,5,3];
        elseif isequal(white_corners, [3 4 2 1])
            turns = [turns, 3,3,6,11,6,9,9,5,12,6,9,9,5,5,4];
        elseif isequal(white_corners, [2 3 1 4])
            turns = [turns, 3,3,6,11,6,9,9,5,12,6,9,9,5,5,3,3];
            
        elseif isequal(white_corners, [2 4 1 3])
            turns = [turns, 3,6,11,6,9,9,5,12,6,9,9,5,5];
        elseif isequal(white_corners, [3 1 2 4])
            turns = [turns, 3,6,11,6,9,9,5,12,6,9,9,5,5,3];
        elseif isequal(white_corners, [1 3 4 2])
            turns = [turns, 3,6,11,6,9,9,5,12,6,9,9,5,5,4];
        elseif isequal(white_corners, [4 2 3 1])
            turns = [turns, 3,6,11,6,9,9,5,12,6,9,9,5,5,3,3];
            
        elseif isequal(white_corners, [1 3 2 4])
            turns = [turns, 4,6,11,6,9,9,5,12,6,9,9,5,5];
        elseif isequal(white_corners, [2 4 3 1])
            turns = [turns, 4,6,11,6,9,9,5,12,6,9,9,5,5,3];
        elseif isequal(white_corners, [4 2 1 3])
            turns = [turns, 4,6,11,6,9,9,5,12,6,9,9,5,5,4];
        elseif isequal(white_corners, [3 1 4 2])
            turns = [turns, 4,6,11,6,9,9,5,12,6,9,9,5,5,3,3];
            
        else
            return_error;
            return;
        end
    end

    function white_corner_orientation()
        correct_white = [];
        for i = 1:2:7
            if (face_colors(1, i) == 1)
                correct_white(end+1) = i;
            end
        end
        switch length(correct_white)
            case 0
                if (face_colors(2,1) == 1 && face_colors(2,3) == 1 && face_colors(4,1) == 1 && face_colors(4,3) == 1)
                    turns = [turns, 9,1,3,2,4,1,3,2,4,1,3,2,4,10];
                elseif (face_colors(3,1) == 1 && face_colors(3,3) == 1 && face_colors(5,1) == 1 && face_colors(5,3) == 1)
                    turns = [turns, 5,9,3,10,4,9,3,10,4,9,3,10,4,6];
                elseif (face_colors(2,3) == 1 && face_colors(4,1) == 1 && face_colors(5,1) == 1 && face_colors(5,3) == 1)
                    turns = [turns, 1,3,3,1,1,4,1,1,4,1,1,3,3,1];
                elseif (face_colors(2,1) == 1 && face_colors(2,3) == 1 && face_colors(3,3) == 1 && face_colors(5,1) == 1)
                    turns = [turns, 11,3,3,11,11,4,11,11,4,11,11,3,3,11];
                elseif (face_colors(2,1) == 1 && face_colors(3,1) == 1 && face_colors(3,3) == 1 && face_colors(4,3) == 1)
                    turns = [turns, 5,3,3,5,5,4,5,5,4,5,5,3,3,5];
                elseif (face_colors(3,1) == 1 && face_colors(4,1) == 1 && face_colors(4,3) == 1 && face_colors(5,3) == 1)
                    turns = [turns, 9,3,3,9,9,4,9,9,4,9,9,3,3,9];
                else
                    return_error;
                    return;
                end
            case 1
                if (face_colors(2,1) == 1 && face_colors(4,1) == 1 && face_colors(5,1) == 1)
                    turns = [turns, 6,4,5,4,6,3,3,5];
                elseif (face_colors(2,1) == 1 && face_colors(3,1) == 1 && face_colors(5,1) == 1)
                    turns = [turns, 10,4,9,4,10,3,3,9];
                elseif (face_colors(2,1) == 1 && face_colors(3,1) == 1 && face_colors(4,1) == 1)
                    turns = [turns, 2,4,1,4,2,3,3,1];
                elseif (face_colors(3,1) == 1 && face_colors(4,1) == 1 && face_colors(5,1) == 1)
                    turns = [turns, 12,4,11,4,12,3,3,11];
                    
                elseif (face_colors(2,3) == 1 && face_colors(4,3) == 1 && face_colors(5,3) == 1)
                    turns = [turns, 5,3,6,3,5,4,4,6];
                elseif (face_colors(2,3) == 1 && face_colors(3,3) == 1 && face_colors(5,3) == 1)
                    turns = [turns, 9,3,10,3,9,4,4,10];
                elseif (face_colors(2,3) == 1 && face_colors(3,3) == 1 && face_colors(4,3) == 1)
                    turns = [turns, 1,3,2,3,1,4,4,2];
                elseif (face_colors(3,3) == 1 && face_colors(4,3) == 1 && face_colors(5,3) == 1)
                    turns = [turns, 11,3,12,3,11,4,4,12];
                else
                    return_error;
                    return;
                end
            case 2
                if (face_colors(2,3) == 1 && face_colors(5,1) == 1)
                    turns = [turns, 10,5,9,2,10,6,9,1];
                elseif (face_colors(2,1) == 1 && face_colors(3,3) == 1)
                    turns = [turns, 2,9,1,12,2,10,1,11];
                elseif (face_colors(3,1) == 1 && face_colors(4,3) == 1)
                    turns = [turns, 12,1,11,6,12,2,11,5];
                elseif (face_colors(4,1) == 1 && face_colors(5,3) == 1)
                    turns = [turns, 6,11,5,10,6,12,5,9];
                    
                elseif (face_colors(2,1) == 1 && face_colors(4,3) == 1)
                    turns = [turns, 5,9,2,10,6,9,1,10];
                elseif (face_colors(3,1) == 1 && face_colors(5,3) == 1)
                    turns = [turns, 9,1,12,2,10,1,11,2];
                elseif (face_colors(2,3) == 1 && face_colors(4,1) == 1)
                    turns = [turns, 1,11,6,12,2,11,5,12];
                elseif (face_colors(3,3) == 1 && face_colors(5,1) == 1)
                    turns = [turns, 11,5,10,6,12,5,9,6];
                    
                elseif (face_colors(2,1) == 1 && face_colors(2,3) == 1)
                    turns = [turns, 1,1,7,2,3,3,1,8,2,3,3,2];
                elseif (face_colors(3,1) == 1 && face_colors(3,3) == 1)
                    turns = [turns, 11,11,7,12,3,3,11,8,12,3,3,12];
                elseif (face_colors(4,1) == 1 && face_colors(4,3) == 1)
                    turns = [turns, 5,5,7,6,3,3,5,8,6,3,3,6];
                elseif (face_colors(5,1) == 1 && face_colors(5,3) == 1)
                    turns = [turns, 9,9,7,10,3,3,9,8,10,3,3,10];
                else
                    return_error;
                    return;
                end
            case 4
                %do nothing
            otherwise
                return_error;
                return;
        end
    end

    function white_edge_orientation()
        correct_white = [];
        for i = 2:2:8
            if (face_colors(1, i) == 1)
                correct_white(end+1) = i;
            end
        end
        
        switch length(correct_white)
            case 0
                turns = [turns, 9,1,3,2,4,10,11,3,5,4,6,12];
            case 2
                if (correct_white(1) == 2 && correct_white(2) == 6)
                    turns = [turns, 1,11,3,12,4,2];
                elseif (correct_white(1) == 4 && correct_white(2) == 8)
                    turns = [turns, 9,1,3,2,4,10];
                    
                elseif (correct_white(1) == 2 && correct_white(2) == 4)
                    turns = [turns, 5,3,9,4,10,6];
                elseif (correct_white(1) == 4 && correct_white(2) == 6)
                    turns = [turns, 11,3,5,4,6,12];
                elseif (correct_white(1) == 6 && correct_white(2) == 8)
                    turns = [turns, 1,3,11,4,12,2];
                elseif (correct_white(1) == 2 && correct_white(2) == 8)
                    turns = [turns, 9,3,1,4,2,10];
                end
            case 4
                %do nothing
            otherwise
                return_error;
                return;
        end
    end

    function refresh_face_colors()
        if (next_turn <= length(turns))
            for i = next_turn:1:length(turns)
                turn(turns(i));
            end
            next_turn = length(turns)+1;
        end
    end






    function turn(dir)
        % R, R', U, U', L, L', D, D', F, F', B, B'
        switch dir
            case 1
                turn_r();
            case 2
                reverse_turn_r();
            case 3
                turn_u();
            case 4
                reverse_turn_u();
            case 5
                turn_l();
            case 6
                reverse_turn_l();
            case 7
                turn_d();
            case 8
                reverse_turn_d();
            case 9
                turn_f();
            case 10
                reverse_turn_f();
            case 11
                turn_b();
            case 12
                reverse_turn_b();
        end
    end

    function turn_r()
        buf1 = face_colors(1, 3);
        buf2 = face_colors(1, 4);
        buf3 = face_colors(1, 5);
        face_colors(1, 3:5) = face_colors(2, 3:5);
        face_colors(2, 3:5) = face_colors(6, 3:5);
        face_colors(6, 3:4) = face_colors(4, 7:8);
        face_colors(6, 5) = face_colors(4, 1);
        face_colors(4, 7) = buf1;
        face_colors(4, 8) = buf2;
        face_colors(4, 1) = buf3;
        for j = 1:2
            buf = face_colors(3,8);
            for i = 8:-1:2
                face_colors(3,i) = face_colors(3,i-1);
            end
            face_colors(3,1) = buf;
        end
    end

    function reverse_turn_r()
        buf = face_colors(1, 3:5);
        face_colors(1, 3:4) = face_colors(4, 7:8);
        face_colors(1, 5) = face_colors(4, 1);
        face_colors(4, 7:8) = face_colors(6, 3:4);
        face_colors(4, 1) = face_colors(6, 5);
        face_colors(6, 3:5) = face_colors(2, 3:5);
        face_colors(2, 3:5) = buf;
        for j = 1:2
            buf = face_colors(3,1);
            for i = 1:7
                face_colors(3,i) = face_colors(3,i+1);
            end
            face_colors(3,8) = buf;
        end
    end

    function turn_u()
        buf = face_colors(2, 1:3);
        for i = 2:4
            face_colors(i, 1:3) = face_colors(i+1, 1:3);
        end
        face_colors(5, 1:3) = buf;
        for a = 1:2
            buf = face_colors(1,8);
            for i = 8:-1:2
                face_colors(1,i) = face_colors(1,i-1);
            end
            face_colors(1,1) = buf;
        end
    end

    function reverse_turn_u()
        buf = face_colors(5, 1:3);
        for i = 5:-1:3
            face_colors(i, 1:3) = face_colors(i-1, 1:3);
        end
        face_colors(2, 1:3) = buf;
        for j = 1:2
            buf = face_colors(1,1);
            for i = 1:7
                face_colors(1,i) = face_colors(1,i+1);
            end
            face_colors(1,8) = buf;
        end
    end

    function turn_l()
        buf1 = face_colors(1, 1);
        buf2 = face_colors(1, 7:8);
        face_colors(1, 1) = face_colors(4, 5);
        face_colors(1, 7:8) = face_colors(4, 3:4);
        face_colors(4, 5) = face_colors(6, 1);
        face_colors(4, 3:4) = face_colors(6, 7:8);
        face_colors(6, 1) = face_colors(2, 1);
        face_colors(6, 7:8) = face_colors(2, 7:8);
        face_colors(2, 1) = buf1;
        face_colors(2, 7:8) = buf2;
        for j = 1:2
            buf = face_colors(5,8);
            for i = 8:-1:2
                face_colors(5,i) = face_colors(5,i-1);
            end
            face_colors(5,1) = buf;
        end
    end

    function reverse_turn_l()
        buf1 = face_colors(1, 1);
        buf2 = face_colors(1, 7:8);
        face_colors(1, 1) = face_colors(2, 1);
        face_colors(1, 7:8) = face_colors(2, 7:8);
        face_colors(2, 1) = face_colors(6, 1);
        face_colors(2, 7:8) = face_colors(6, 7:8);
        face_colors(6, 1) = face_colors(4, 5);
        face_colors(6, 7:8) = face_colors(4, 3:4);
        face_colors(4, 5) = buf1;
        face_colors(4, 3:4) = buf2;
        for j = 1:2
            buf = face_colors(5,1);
            for i = 1:7
                face_colors(5,i) = face_colors(5,i+1);
            end
            face_colors(5,8) = buf;
        end
    end

    function turn_d()
        buf = face_colors(2, 5:7);
        face_colors(2, 5:7) = face_colors(5, 5:7);
        face_colors(5, 5:7) = face_colors(4, 5:7);
        face_colors(4, 5:7) = face_colors(3, 5:7);
        face_colors(3, 5:7) = buf;
        for j = 1:2
            buf = face_colors(6,8);
            for i = 8:-1:2
                face_colors(6,i) = face_colors(6,i-1);
            end
            face_colors(6,1) = buf;
        end
    end

    function reverse_turn_d()
        buf = face_colors(2, 5:7);
        face_colors(2, 5:7) = face_colors(3, 5:7);
        face_colors(3, 5:7) = face_colors(4, 5:7);
        face_colors(4, 5:7) = face_colors(5, 5:7);
        face_colors(5, 5:7) = buf;
        for j = 1:2
            buf = face_colors(6,1);
            for i = 1:7
                face_colors(6,i) = face_colors(6,i+1);
            end
            face_colors(6,8) = buf;
        end
    end

    function turn_f()
        buf1 = face_colors(1, 7);
        buf2 = face_colors(1, 5:6);
        face_colors(1, 5:7) = face_colors(5, 3:5);
        face_colors(5, 3:5) = face_colors(6, 1:3);
        face_colors(6, 1:2) = face_colors(3, 7:8);
        face_colors(6, 3) = face_colors(3, 1);
        face_colors(3, 1) = buf1;
        face_colors(3, 7:8) = buf2;
        for j = 1:2
            buf = face_colors(2,8);
            for i = 8:-1:2
                face_colors(2,i) = face_colors(2,i-1);
            end
            face_colors(2,1) = buf;
        end
    end

    function reverse_turn_f()
        buf = face_colors(1, 5:7);
        face_colors(1, 7) = face_colors(3, 1);
        face_colors(1, 5:6) = face_colors(3, 7:8);
        face_colors(3, 1) = face_colors(6,3);
        face_colors(3,7:8) = face_colors(6,1:2);
        face_colors(6,1:3) = face_colors(5,3:5);
        face_colors(5,3:5) = buf;
        for j = 1:2
            buf = face_colors(2,1);
            for i = 1:7
                face_colors(2,i) = face_colors(2,i+1);
            end
            face_colors(2,8) = buf;
        end
    end

    function turn_b()
        buf1 = face_colors(1,1:2);
        buf2 = face_colors(1,3);
        face_colors(1,1:3) = face_colors(3,3:5);
        face_colors(3,3:5) = face_colors(6,5:7);
        face_colors(6,5:6) = face_colors(5,7:8);
        face_colors(6,7) = face_colors(5,1);
        face_colors(5,7:8) = buf1;
        face_colors(5,1) = buf2;
        for j = 1:2
            buf = face_colors(4,8);
            for i = 8:-1:2
                face_colors(4,i) = face_colors(4,i-1);
            end
            face_colors(4,1) = buf;
        end
    end

    function reverse_turn_b()
        buf = face_colors(1,1:3);
        face_colors(1,3) = face_colors(5,1);
        face_colors(1,1:2) = face_colors(5,7:8);
        face_colors(5,1) = face_colors(6,7);
        face_colors(5,7:8) = face_colors(6,5:6);
        face_colors(6,5:7) = face_colors(3,3:5);
        face_colors(3,3:5) = buf;
        for j = 1:2
            buf = face_colors(4,1);
            for i = 1:7
                face_colors(4,i) = face_colors(4,i+1);
            end
            face_colors(4,8) = buf;
        end
    end
end