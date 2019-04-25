function [abort, success, turns]  = f2l_recursive(cube, depth, useless_turns, last_fitness)
    abort = false;
    success = false;
    turns = [];
    if (depth > 20)
        return;
    end
    fitnesses = zeros(1, 12);
	for k = 1:12
        if (~ismember(k, useless_turns))
            fitnesses(k) = calc_fitness(turn(k, cube));
        end
    end
    
    while (max(fitnesses) > last_fitness)
        [fitness, dir] = max(fitnesses);
        if (fitness >= 28)
            success = true;
            turns(end+1) = dir;
            break;
        end
        if (mod(dir, 2) == 0)
            useless_turn = dir - 1;
        else
            useless_turn = dir + 1;
        end
        [abort, success, turns] = f2l_recursive(turn(dir, cube), depth + 1, useless_turn, fitness);
        if (abort || success)
            turns(end+1) = dir;
            break;
        end
        fitnesses(dir) = 0;
    end
    
    
    function fitness = calc_fitness(cube)
        fitness = 0;
        for i = 1:8
            if (cube(6,i) == 6)
                fitness = fitness + 1;
            end
        end
        for i = 2:5
            for j = 4:8
                if (cube(i,j) == i)
                    fitness = fitness + 1;
                end
            end
        end
    end
end