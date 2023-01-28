import numpy as np


class KMeansClustering:
    def __init__(self, n_clusters, n_init=10, max_iter=1000, delta=0.001):

        self.n_cluster = n_clusters
        self.n_init = n_init
        self.max_iter = max_iter
        self.delta = delta

    def init_centroids(self, data):
        idx = np.random.choice(
            data.shape[0], size=self.n_cluster, replace=False)
        self.centroids = np.copy(data[idx, :])

    def fit(self, data):
   
        if data.shape[0] < self.n_cluster:
            raise ValueError(
                'Number of clusters is grater than number of datapoints')

        best_centroids = None
        m_score = float('inf')

        for _ in range(self.n_init):
            self.init_centroids(data)

            for _ in range(self.max_iter):
                cluster_assign = self.e_step(data)
                old_centroid = np.copy(self.centroids)
                self.m_step(data, cluster_assign)

                if np.abs(old_centroid - self.centroids).sum() < self.delta:
                    break

            cur_score = self.evaluate(data)

            if cur_score < m_score:
                m_score = cur_score
                best_centroids = np.copy(self.centroids)

        self.centroids = best_centroids

        return self

    def e_step(self, data):

        t = []
        for i in range(len(data)):
            for j in range(len(self.centroids)):
                t.append(np.linalg.norm(self.centroids[j] - data[i]))
        c = []

        dt = np.reshape(t,(len(data),len(self.centroids)))

        for k in range(len(dt)):
            c.append(np.argmin(dt[k])) 
        return c

    def m_step(self, data, cluster_assgn):

        
        x_coord = len(self.centroids)
        y_coord = len(self.centroids[0])
        new_cent = np.zeros(shape=(x_coord, y_coord))
        j = 0
        for i in cluster_assgn:
            new_cent[i] = np.add(new_cent[i],data[j])
            j += 1

        cluster_assgn = np.array(cluster_assgn)

        for k in range(len(new_cent)):
            count = (cluster_assgn == k).sum()
            new_cent[k] = new_cent[k]*(1/count)  

        self.centroids = new_cent

    def evaluate(self, data):

        dist = []
        m = len(data)
        n = len(self.centroids)
        for i in range(m):
            for j in range(n):
                dist.append(np.square(self.centroids[j] - data[i]))
        dist = np.sum(dist, axis=1)
        t = 0
        for i in dist:
            t += i
        return t