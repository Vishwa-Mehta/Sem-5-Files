import numpy
import pygad
import pygad.nn
import pygad.gann

def fitness_func(solution, sol_id):
    global GANN_inst, data_ips, data_ops

    prediction = pygad.nn.predict(last_layer = GANN_inst.population_networks[sol_id], data_inputs = data_ips)
    correct_prediction = numpy.where(prediction == data_ops)[0].size
    sol_fitness = (correct_prediction / data_ops.size) * 100
    return sol_fitness

def callback_generation(ga_inst):
    global GANN_inst
    populn_matrices = pygad.gann.population_as_matrices(population_networks = GANN_inst.population_networks, population_vectors = ga_inst.population)
    GANN_inst.update_population_trained_weights(population_trained_weights = populn_matrices)
    print("Generation = {generation}".format(generation = ga_inst.generations_completed))
    print("Accuracy   = {fitness}".format(fitness = ga_inst.best_solution()[1]))

data_ips = numpy.array([[1, 1], [1, 0], [0, 1], [0, 0]])

data_ops = numpy.array([0, 1, 1, 0])

GANN_inst = pygad.gann.GANN(num_solutions = 10, num_neurons_input = 2, num_neurons_hidden_layers = [2], num_neurons_output = 2, hidden_activations = ["relu"], output_activation = "softmax")
population_vectors = pygad.gann.population_as_vectors(population_networks = GANN_inst.population_networks)

ga_inst = pygad.GA(num_generations = 50, num_parents_mating = 3, initial_population = population_vectors.copy(), fitness_func = fitness_func, mutation_percent_genes = 10, callback_generation = callback_generation)

ga_inst.run()

sol, sol_fitness, sol_idx = ga_inst.best_solution()
print("Solution: ", sol)
print("solution_fitness:", sol_fitness)
print("solution_idx:", sol_idx)
