% Calculates the chi squared value between 2 lists of energies.
function chi_squared = calculate_chi_squared(total_intensities_experimental, total_intensities_theory, E_buckets)
    % We cut all the data for E < 0.7 out of the experimental data
    % as it is full of elastic scattering data, which isn't calculated
    % by SpinW.
    cutoff_index = find(E_buckets >= 0.7, 1, 'first');
    calculation_intensities_experimental = total_intensities_experimental(1, cutoff_index:end);
    calculation_intensities_theory = total_intensities_theory(1, cutoff_index:end);

    sum = 0;
    for i = 1:size(calculation_intensities_theory, 2)
        diff = calculation_intensities_experimental(i) - calculation_intensities_theory(i);
        sum = sum + diff;
    end
    disp(sum^2);
    
    chi_squared = sum^2;
end