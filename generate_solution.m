function turns = generate_solution(face_color_code)
    turns = [];
    


















    correct_white = [];
    for i = 2:2:8
        if (face_color_code(1, i) == 1)
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
        otherwise
            
    end
end