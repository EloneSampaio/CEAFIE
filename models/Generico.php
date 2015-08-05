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

    public function editar($aluno, $pessoa) {
        $this->em->getConnection()->beginTransaction();
        try {

            $editar1 = $this->em->getRepository('models\Pessoa')->find(array('id' => $pessoa->getId()));
            $editar1->setNome($pessoa->getNome());
            $editar1->setGenero($pessoa->getGenero());
            $editar1->setNacionalidade($pessoa->getNacionalidade());
            $editar1->setTelefone($pessoa->getTelefone());
            $editar1->setEmail($pessoa->getEmail());
            $editar1->setBi($pessoa->getBi());
            $this->em->merge($editar1);
            $this->em->flush();

////aluno
            $editar = $this->em->getRepository('models\Aluno')->find(array('id' => $aluno->getId()));
            $editar->setGraduacao($aluno->getGraduacao());
            $editar->setUniversidade($aluno->getUniversidade());
            $editar->setUnidadeOrganica($aluno->getUnidadeOrganica());
            $editar->setCategoriaDocente($aluno->getCategoriaDocente());
            $editar->setFuncao($aluno->getFuncao());
            $editar->setCategoriaCientifica($aluno->getCategoriaCientifica());
            $this->em->merge($editar);
            $this->em->flush();
            $this->em->getConnection()->commit();
            return TRUE;
        } catch (Exception $exc) {
            $this->em->getConnection()->rollback();
            $this->em->close();
            throw $ex;
        }



        return TRUE;
    }

    public function pesquisar($id = FALSE) {
        if ($id) {
            return $this->em->getRepository('models\Aluno')->findOneBy(array('id' => $id));
            $this->em->flush();
        } else {
            return $this->em->getRepository('models\Aluno')->findby(array(), array('id' => "DESC"));
            $this->em->flush();
        }
    }

    public function remover($id = FALSE) {
        
    }

    public function listagem($entidade) {
        $model = "models" . "\\" . $entidade;
        $t = $this->em->getRepository($model);
        $qb = $t->createQueryBuilder('e');
        return $qb->getQuery()->getResult(\Doctrine\ORM\Query::HYDRATE_ARRAY);
    }

}
