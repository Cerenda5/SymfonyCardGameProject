<?php

namespace App\Controller;

use App\Entity\Faction;
use App\Form\FactionType;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class FactionController extends AbstractController
{
    /**
     * @Route("/faction", name="faction")
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function faction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        $faction = new Faction();
        $formFaction = $this->createForm(FactionType::class, $faction);

        $factions = $em->getRepository(Faction::class)->findAll();
        $formFaction->HandleRequest($request);
        if ($formFaction->isSubmitted() && $formFaction->isValid()) {
            $em->persist($faction);
            $em->flush();
        }

        return $this->render('faction/index.html.twig', [
            'factions' => $factions,
            "form" => $formFaction->createView()
        ]);
    }
}
