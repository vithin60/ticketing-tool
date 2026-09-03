-- CreateTable
CREATE TABLE "_TaskReviewingManagers" (
    "A" UUID NOT NULL,
    "B" UUID NOT NULL,

    CONSTRAINT "_TaskReviewingManagers_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE INDEX "_TaskReviewingManagers_B_index" ON "_TaskReviewingManagers"("B");

-- AddForeignKey
ALTER TABLE "tasks" DROP CONSTRAINT "tasks_reviewingManagerId_fkey";

-- DropIndex
DROP INDEX "tasks_reviewingManagerId_idx";

-- AlterTable
ALTER TABLE "tasks" DROP COLUMN "reviewingManagerId";

-- AddForeignKey
ALTER TABLE "_TaskReviewingManagers" ADD CONSTRAINT "_TaskReviewingManagers_A_fkey" FOREIGN KEY ("A") REFERENCES "tasks"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_TaskReviewingManagers" ADD CONSTRAINT "_TaskReviewingManagers_B_fkey" FOREIGN KEY ("B") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
