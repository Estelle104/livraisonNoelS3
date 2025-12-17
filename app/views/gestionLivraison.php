<h2>Gestion des livraisons</h2>

<h3>Nouvelle livraison</h3>

<form id="formLivraison">
    <!-- sera rempli à l'étape suivante -->
</form>

<hr>

<h3>Liste des livraisons</h3>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Destination</th>
        <th>Date</th>
        <th>État</th>
        <th>Actions</th>
    </tr>

    <?php foreach ($livraisons as $l): ?>
        <tr>
            <td><?= $l['id'] ?></td>
            <td><?= $l['destination'] ?></td>
            <td><?= $l['dateLivraison'] ?></td>
            <td><?= $l['idEtat'] ?></td>
            <td>
                <?php if ($l['idEtat'] == 1): ?>
                    <button>Livrer</button>
                    <button>Annuler</button>
                <?php else: ?>
                    <button disabled>Action impossible</button>
                <?php endif; ?>
            </td>
        </tr>
    <?php endforeach; ?>
</table>
<script src="/js/gestionLivraison.js"></script>