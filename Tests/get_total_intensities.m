
% Takes in a matrix of S values and sums the intensities for
% each value of Q
function total_intensities = get_total_intensities(Q_data, data)
    total_intensities = zeros(1, size(data, 1)); %floor((Q_max-Q_min) / slice_size)]);

    for i = 1:size(data, 1)%floor((Q_max-Q_min) / slice_size)
        % [first_index, last_index] = get_q_index_range(Q_centre, slice_size, Q_data);
        sliced_data = data(i, 1:end);
        total_energy = sum(sliced_data);

        total_intensities(i) = sum(total_energy);
    end
end