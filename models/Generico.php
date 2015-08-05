<?php

namespace models;

use config\Doctrine;

class Generico extends Doctrine {

    public function adicionar($dados, $entidade) {

        $classe = (string) ucfirst($entidade);
        $model = "\\" . "models" . "\\" . $classe;
        $enty = new $model();
        $enty->setNome($dados);
        $this->em->persist($enty);
        $this->em->flush();
        return $enty->getId();
    }

    public function editar($entidade, $id,$dados) {
        $classe = (string) ucfirst($entidade);
        $model = "\\" . "models" . "\\" . $classe;
        $editar = $this->em->getRepository($model)->find(array('id' => $id));
        $editar->setNome($dados['nome']);
        $this->em->merge($editar);
        $this->em->flush();
        return TRUE;
    }

    public function pesquisar($entidade = FALSE, $id = FALSE) {

        if ($id) {
            $classe = (string) ucfirst($entidade);
            $model = "\\" . "models" . "\\" . $classe;

            return $this->em->getRepository($model)->find($id);
            $this->em->flush();
        } else {
            $classe = (string) ucfirst($entidade);
            $model = "\\" . "models" . "\\" . $classe;

            return $this->em->getRepository($model)->findby(array(), array('id' => "DESC"));
            $this->em->flush();
        }
    }

    public function remover($id = FALSE, $entidade) {
        $classe = (string) ucfirst($entidade);
        $model = "\\" . "models" . "\\" . $classe;
        $id = $this->em->getPartialReference($model, $id);
        $this->em->remove($id);
        $this->em->flush();
        return TRUE;
    }

    public function listagem($entidade) {
        $model = "models" . "\\" . $entidade;
        $t = $this->em->getRepository($model);
        $qb = $t->createQueryBuilder('e');
        return $qb->getQuery()->getResult(\Doctrine\ORM\Query::HYDRATE_ARRAY);
    }

}
