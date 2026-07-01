import { pilotSubsets } from "../../barmatrix-app/lib/jesuslovesyou/pilot-data";
import {
  evidenceQuestionDetails,
  evidenceSeedCandidates,
} from "../../barmatrix-app/lib/jesuslovesyou/evidence-question-details";
import { conLawQuestionDetails } from "../../barmatrix-app/lib/jesuslovesyou/conlaw-question-details";
import { conLawSeedCandidates } from "../../barmatrix-app/lib/jesuslovesyou/conlaw-seed-candidates";
import { summarizeQa } from "../../barmatrix-app/lib/jesuslovesyou/qa-summary";

console.log(
  JSON.stringify({
    pilots: pilotSubsets,
    evidence: {
      details: evidenceQuestionDetails,
      seeds: evidenceSeedCandidates,
      summary: summarizeQa(evidenceQuestionDetails),
    },
    conlaw: {
      details: conLawQuestionDetails,
      seeds: conLawSeedCandidates,
      summary: summarizeQa(conLawQuestionDetails),
    },
  }),
);
