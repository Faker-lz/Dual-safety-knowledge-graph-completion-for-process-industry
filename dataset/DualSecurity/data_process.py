import random

def mark_data(path):
    dataset = []
    entities2id = {}
    relations2id = {}
    entities_id = 0
    relations_id = 0
    with open(path + '/all_data.txt', 'r') as file:
        for line in file:
            h, r, t = line.split()
            if r not in relations2id.keys():
                relations2id[r] = str(relations_id)
                relations_id += 1
            if h not in entities2id.keys():
                entities2id[h] = str(entities_id)
                entities_id += 1
            if t not in entities2id.keys():
                entities2id[t] = str(entities_id)
                entities_id += 1
            dataset.append(entities2id[h] + '\t' + relations2id[r] + '\t' + entities2id[t] + '\n')

    with open(path + '/all_data2.txt', 'w') as file:
        for _, data in enumerate(dataset):
            file.write(data)

def data_process(path):
    dataset = []
    id2entities = {}
    id2relations = {}  
    entities_id = 0
    relations_id = 0
    with open(path + '/all_data2.txt', 'r') as file:
        for line in file:
            h,r,t = line.split()
            if r not in id2relations.values():
                id2relations[relations_id] = r
                relations_id += 1
            if h not in id2entities.values():
                id2entities[entities_id] = h
                entities_id += 1
            if t not in id2entities.values():
                id2entities[entities_id] = t
                entities_id += 1
            dataset.append(h + '\t'+ r + '\t' + t + '\n')

    total_nums = len(dataset)
    valid_nums = int(total_nums * 0.1)
    train_nums = int(total_nums * 0.8)
    test_nums = total_nums - valid_nums - train_nums

    test = [dataset.pop(random.randint(0, len(dataset) - 1)) for _ in range(test_nums)]
    train = [dataset.pop(random.randint(0, len(dataset) - 1)) for _ in range(train_nums)]
    valid = [dataset.pop(random.randint(0, len(dataset) - 1)) for _ in range(valid_nums)]

    with open(path + '/train.txt', 'w') as file:
        for _, relation in enumerate(train):
            file.write(relation)

    with open(path + '/test.txt', 'w') as file:
        for _, relation in enumerate(test):
            file.write(relation)

    with open(path + '/valid.txt', 'w') as file:
        for _, relation in enumerate(valid):
            file.write(relation)

    with open(path + '/entities.dict', 'w') as file:
        for id, entity in id2entities.items():
            file.write(str(id) + '\t' + entity + '\n')

    with open(path + '/relations.dict', 'w') as file:
        for id, relation in id2relations.items():
            file.write(str(id) + '\t' + relation + '\n')



if __name__ == '__main__':
    data_process(r'E:\study\now\研究生\写论文\electronics\code\NeuralKG-main\dataset\DualSecurity')